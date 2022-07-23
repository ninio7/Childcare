class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @customer = Customer.find(params[:customer_id])
    @contact = Contact.new()
  end

  def index
    @customer = Customer.find(params[:customer_id])
    if params[:created_at_from].present? && params[:created_at_to].present?
      @contacts = @customer.contacts.where(status: "published").where(created_at: DateTime.strptime(params[:created_at_from], '%Y-%m-%d')..DateTime.strptime(params[:created_at_to], '%Y-%m-%d').end_of_day).group("date(created_at)", :child_id)
    else
      @contacts = @customer.contacts.group("date(created_at)", :child_id).page(params[:page]).per(15).reverse_order
    end
    @contact_page = @customer.contacts.group("date(created_at)", :child_id).page(params[:page]).per(15).reverse_order
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @contact = @customer.contacts.build(contact_params)
    @contact.admin_id = current_admin.id
    if @contact.save
      @contact.create_notification_by_admin(current_admin, @customer)
      flash[:notice]="新規登録しました"
      redirect_to admin_customer_contacts_path
    else
      render :new
    end
  end

  def edit
     @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:notice] = "連絡帳を変更しました"
      redirect_to admin_customer_contacts_path(@contact.customer)
    else
      render :edit
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:customer_id, :admin_id, :child_id, :weather, :staple, :main, :side, :dessert, :staple_quantity, :main_quantity, :side_quantity, :dessert_quantity, :nap_started_at, :nap_finished_at, :comment, :humor, :defecation, :defecation_number, :temperture, :tempertured_at, :status, images: [])
  end

end

