class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.order(created_at: :desc).page(params[:page]).per(10)
    @groups = Group.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を変更しました"
      redirect_to admin_customer_path
    else
      render :edit
    end
  end

  def search
    if params[:name].present?
      @customers = Customer.where('name LIKE ?', "%#{params[:name]}%")
    else
      @customers = Customer.none
    end
     @customer_name=params[:name]
     @customers_all_count=Customer.where("name LIKE ?","%#{@customer_name}%").count
     @groups = Group.all
  end

  private
  
   def customer_params
     params.require(:customer).permit(:child_id, :name,:kana_name,:email,:postal_code,:address,:phone_number,:encrypted_password,:is_deleted)
   end
   
end

