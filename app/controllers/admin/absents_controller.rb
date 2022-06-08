class Admin::AbsentsController < ApplicationController

  def index
    @customer = Customer.find(params[:customer_id])
    @absents = Absent.where(customer_id:params[:customer_id])
    @absents_all_count = Absent.all.count
  end


end

