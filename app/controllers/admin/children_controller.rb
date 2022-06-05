class Admin::ChildrenController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customer = Customer.find(params[:customer_id])
    @children = Child.where(customer_id:params[:customer_id])
    @child = Child.new
    @groups = Group.all
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @child = Child.find(params[:id])

  end

  def create
    @customer = Customer.find(params[:customer_id])
    @child = @customer.children.new(child_params)
      if @child.save
        flash[:notice]="新規登録しました"
        redirect_to admin_customer_children_path
      else
        @children = Child.all
        render :index
      end
  end

  def update
    @child = Child.find(params[:id])
    if @child.update(child_params)
         flash[:notice]="登録内容を変更しました"
      redirect_to admin_customer_children_path
    else
       @children = Child.all
       render :index
    end
  end

   def destroy
    @child = Child.find(params[:id])
    @child.destroy
    redirect_to admin_customer_children_path
   end

private

  def child_params
    params.require(:child).permit(:name, :kana_name, :group_id, :birthday, :customer_id)
  end

end