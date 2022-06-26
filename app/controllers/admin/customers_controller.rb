class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.order("kana_name").page(params[:page])
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
    @customer_name=params[:name]
    @groups = Group.all
    if params[:name].present?
      @customers = Customer.where('name LIKE ?', "%#{params[:name]}%").page(params[:page])
    else
      @customers = Customer.all.page(params[:page])
      render :index
    end
  end

  private

   def customer_params
     params.require(:customer).permit(:child_id, :name,:kana_name,:email,:postal_code,:address,:phone_number,:encrypted_password,:is_deleted)
   end

end

