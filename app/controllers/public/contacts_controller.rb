class Public::ContactsController < ApplicationController
  before_action :authenticate_customer!,except: [:show]
  before_action :is_login?, only: [:show]

  def new
    @customer = current_customer
    @contact = Contact.new()
  end

  def index
    @customer = current_customer
    if params[:created_at_from].present? && params[:created_at_to].present?
      @contacts = current_customer.contacts.where(status: "published").where(created_at: DateTime.strptime(params[:created_at_from], '%Y-%m-%d')..DateTime.strptime(params[:created_at_to], '%Y-%m-%d').end_of_day).group("date(created_at)", :child_id)
    else
      @contacts = current_customer.contacts.where(status: "published").group("date(created_at)", :child_id).page(params[:page]).per(10).reverse_order
    end
    @contact_page = current_customer.contacts.where(status: "published").group("date(created_at)", :child_id).page(params[:page]).per(10).reverse_order
  end

  def show
    @child = Child.find(params[:child_id])
    date_begin = Time.zone.parse(params[:created_at]).beginning_of_day
    date_end = Time.zone.parse(params[:created_at]).end_of_day
    @contacts = Contact.where(created_at: date_begin..date_end, child_id: @child.id).order(:admin_id)
    if !current_admin.present? && current_customer.id != @child.customer_id
      redirect_to contacts_path
    end
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.customer_id = current_customer.id
    # 管理者は1人しか存在しないのでfirstで1件のみを取得するので十分
    target_admin = Admin.first

    if @contact.save
      @contact.create_notification_by_customer(current_customer, target_admin)
      flash[:notice]="新規登録しました"
      redirect_to contacts_path
    else
      render :new
    end
  end

  def search
    if params[:created_at].present?
      @contacts = current_customer.contacts.where('created_at LIKE ?', "%#{params[:created_at]}%").group("date(created_at)", :child_id)
    else
      @contacts = Contact.none
    end
     @contact_created_at=params[:created_at]
  end


  private

  def contact_params
    params.require(:contact).permit(:customer_id, :child_id, :admin_id, :weather, :staple, :main, :side, :dessert, :staple_quantity, :main_quantity, :side_quantity, :dessert_quantity, :comment, :humor, :defecation, :defecation_number, :temperture, :tempertured_at, :dinner, :dinner_time,:dinner_quantity, :breakfast, :breakfast_time, :breakfast_quantity ,:sleep_started_at, :sleep_finished_at, :sleep_degree, :pickup_person, :pickuped_at, :status)
  end

  def is_login?
    if !current_customer.present? && !current_admin.present?
      redirect_to customer_session_path
    end
  end

end
