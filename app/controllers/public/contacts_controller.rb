class Public::ContactsController < ApplicationController
  # before_action :authenticate_customer!
  def new
    @contact = Contact.new
    @weekday = days[day]
    @date = Date.current.strftime('%Y年 %m月 %d日')

  end

  def index
    @customer = current_customer
    @contacts = Contact.published.page(params[:page]).per(10).reverse_order
    # @contacts = current_customer.contacts.page(params[:page])
    @contacts_all_count=Contact.all.count
  end

  def show
    @customer = Customer.where(params[:customer_id])
    #@contact = Contact.find(params[:id])
    # byebug
    #園の投稿（customerが投稿した日と同じ日の投稿）を取得
    @contact = @contact.customer_contact(@contact.created_at.day)

    #@contact_from_en = Contact.where(customer_id: @contact.customer.id, created_at: @contact.created_at.all_day).map{|c| c if c.admin_id.present?}.compact.first
    @contact_from_en = @contact.admin_contact(@contact.created_at.day)

    @contact.customer
  end

  def cotact_contacts
    @contactsPair = ContactContacts.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.customer_id = current_customer.id

    # 管理者は1人しか存在しないハズ
    # なのでfirstで1件のみを取得するので十分なハズ
    target_admin = Admin.first

    if @contact.save
      if ContactContact.find_by(day: @contact.created_at.day)
       contact = ContactContact.find_by(day: @contact.created_at.day)
       contact.update(customer_contact_id: @contact.id)
      else
        ContactContact.create(customer_contact_id: @contact.id, day: @contact.created_at.day)
      end
      @contact.create_notification_by_customer(current_customer, target_admin)
      flash[:notice]="新規登録しました"
      redirect_to contacts_path
    else
       @contacts = Contact.all
       render :index
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:customer_id, :child_id, :admin_id, :weather, :staple, :main, :side, :dessert, :staple_quantity, :main_quantity, :side_quantity, :dessert_quantity, :comment, :humor, :defecation, :defecation_number, :temperture, :tempertured_at, :dinner, :dinner_time,:dinner_quantity, :breakfast, :breakfast_time, :breakfast_quantity ,:sleep_started_at, :sleep_finished_at, :sleep_degree, :pickup_person, :pickuped_at, :status)
  end
end
