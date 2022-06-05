class Public::ContactsController < ApplicationController
  # before_action :authenticate_customer!
  def new
    @contact = Contact.new
    @weekday = days[day]
    @date = Date.current.strftime('%Y年 %m月 %d日')

  end

  def index
    @customer = current_customer
     @contacts = current_customer.contacts.page(params[:page])
     @contacts_all_count=Contact.all.count
  end

  def show
    @contact = Contact.find(params[:id])
    @weekday = days[day]
    @date = Date.current.strftime('%Y年 %m月 %d日')
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.customer_id = current_customer.id
    if @contact.save
      flash[:notice]="新規登録しました"
      redirect_to contacts_path
    else
       @contacts = Contact.all
       render :index
    end
  end

    private

  def contact_params
    params.require(:contact).permit(:customer_id, :child_id, :admin, :contacted_at, :weather, :staple, :main_dish, :side_dish, :dessert, :quantity, :nap_start, :nap_end, :comment, :humor, :defecation, :dafecation_number, :temperture, :temperture_time, :dinner, :dinner_time, :breakfast, :breakfast_time, :sleep_time, :sleep_degree, :pickup_person, :pickup_time, :status)
  end
end
