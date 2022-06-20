class Admin::AbsentsController < ApplicationController

  def index
    @customer = Customer.find(params[:customer_id])
    @absents = Absent.where(customer_id:params[:customer_id]).page(params[:page]).per(10).reverse_order
  end

end

