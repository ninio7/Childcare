class Admin::ContactsController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @contact = Contact.new
    @weekday = days[day]
    @date = Date.current.strftime('%Y年 %m月 %d日')

  end

  def index
     @customer = Customer.find(params[:customer_id])
      # @contacts = Contact.where(customer_id:params[:customer_id])
   　 @contacts = Contact.all
     @contacts_all_count=Contact.all.count
  end

  def show
    # @customer = Customer.find(params[:customer_id])
    @contact = Contact.find(params[:id])
    @weekday = days[day]
    @date = Date.current.strftime('%Y年 %m月 %d日')
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @contact = @customer.contacts.new(contact_params)
    @contact.admin_id = current_admin.id
     if @contact.save
      flash[:notice]="新規登録しました"
      redirect_to admin_customer_contacts_path
    else
       @contacts = Contact.all
       render :index
    end
  end

    private

  def contact_params
    params.require(:contact).permit(:customer_id, :admin_id, :child_id, :image, :contacted_at, :weather, :staple, :main_dish, :side_dish, :dessert, :quantity, :nap_start, :nap_end, :comment, :humor, :defecation, :dafecation_number, :temperture, :temperture_time, :dinner, :dinner_time, :breakfast, :breakfast_time, :sleep_time, :sleep_degree, :pickup_person, :pickup_time, :status)
  end
end

