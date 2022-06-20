class Public::ContactsController < ApplicationController
  before_action :authenticate_customer!
  def new
    @customer = current_customer
    @contact = Contact.new()
  end

  def index
    @customer = current_customer
    @contacts = current_customer.contacts.where(status: "published").page(params[:page]).per(10).reverse_order
    @contacts_all_count=Contact.all.count
    @contact_contacts = ContactContact.where(customer_id: current_customer.id)
  end
  
  #中間テーブルを使用しない場合↓
  # def show
  #   @customer = current_customer
  #   @contact = Contact.find(params[:id])
  #   園の投稿（customerが投稿した日と同じ日の投稿）を取得
  #   @contact_from_en = Contact.where(customer_id: @contact.customer.id, created_at: @contact.created_at.all_day).map{|c| c if c.admin_id.present?}.compact.first
  #   @contact_from_en = @contact.admin_contact(@contact.created_at.day)
  # end

  def cotact_contacts
    @contactsPair = ContactContacts.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.customer_id = current_customer.id
    @contact.type = 'customer'
    @contact.user_id = current_customer.id
    # 管理者は1人しか存在しないハズ
    # なのでfirstで1件のみを取得するので十分なハズ
    target_admin = Admin.first

    if @contact.save
      if ContactContact.check_admin_contact(@contact.created_at.day, target_admin)
       contact = ContactContact.find_by(day: @contact.created_at.day)
       contact.update(customer_contact_id: @contact.id)
      else
        ContactContact.create(customer_contact_id: @contact.id, day: @contact.created_at.day, admin_id: target_admin, customer_id: current_customer.id )
      end
      @contact.create_notification_by_customer(current_customer, target_admin)
      flash[:notice]="新規登録しました"
      redirect_to contacts_path
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:customer_id, :child_id, :admin_id, :weather, :staple, :main, :side, :dessert, :staple_quantity, :main_quantity, :side_quantity, :dessert_quantity, :comment, :humor, :defecation, :defecation_number, :temperture, :tempertured_at, :dinner, :dinner_time,:dinner_quantity, :breakfast, :breakfast_time, :breakfast_quantity ,:sleep_started_at, :sleep_finished_at, :sleep_degree, :pickup_person, :pickuped_at, :status)
  end
end
