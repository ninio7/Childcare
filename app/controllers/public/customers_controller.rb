class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = Customer.find(params[:id])
     if @customer.update(customer_params)
         flash[:notice]="登録内容を変更しました"
      redirect_to customer_path
     else
       @customers = Customer.all
       render :index
     end
  end

  private

  def customer_params
    params.require(:customer).permit(:address, :postal_code, :phone_namber, :email)
  end

end
