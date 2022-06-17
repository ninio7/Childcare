class Admin::ContactsController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @contact = Contact.new()
    @weekday = days[day]
    @date = Date.current.strftime('%Y年 %m月 %d日')
  end

  def index

     @customer = Customer.find(params[:customer_id])
    # @contacts = Contact.published.where(customer_id: params[:customer_id]).page(params[:page]).per(10).reverse_order
     #@contacts = @contacts.where('location LIKE ?', "%#{params[:search]}%") if params[:search].present?
     @contacts = Contact.published.where(type: 'admin', user_id: current_admin.id).page(params[:page]).per(10).reverse_order
     @contacts_all_count = Contact.all.count
    # admin_contact_ids = Contact.where(type: 'admin', user_id: current_admin.id).ids
    # customer_contact_ids = Contact.where(type: 'customer', user_id: @customer.id).ids
    # contact_contact_ids = ContactContact.where(admin_contact_id: admin_contact_ids).ids & ContactContact.where(customer_contact_id: customer_contact_ids).ids
     @contact_contacts = ContactContact.where(admin_id: current_admin.id, customer_id: @customer.id)
      @day = params[:day]

  end

  def confirm
    @contacts = current_admin.contacts.draft.page(params[:page]).per(10).reverse_order
  end

  def show
    @customer = Customer.find(params[:customer_id])
    @contact = Contact.find(params[:id])
    #中間テーブル（contact_contact）を使わないとき↓
    # @contact_from_en = Contact.where(customer_id: @contact.customer.id, created_at: @contact.created_at.all_day).map{|c| c if c.admin_id.present?}.compact.first
    # @contact_from_customer = Contact.where(customer_id: @contact.customer.id, created_at: @contact.created_at.all_day).map{|c| c if c.customer_id.present?}.compact.first
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @contact = @customer.contacts.new(contact_params)
    @contact.type = 'admin'
    @contact.user_id = current_admin.id
    if @contact.save
      @contact.create_notification_by_admin(current_admin, @customer)
      if ContactContact.check_customer_contact(@contact.created_at.day, @customer)
       contact = ContactContact.find_by(day: @contact.created_at.day)
       contact.update(admin_contact_id: @contact.id)
      else
        ContactContact.create(admin_contact_id: @contact.id, day: @contact.created_at.day, admin_id: current_admin.id, customer_id: @customer.id)
      end

      flash[:notice]="新規登録しました"
      redirect_to admin_customer_contacts_path
    else
      @contacts = Contact.all
      render :index
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

