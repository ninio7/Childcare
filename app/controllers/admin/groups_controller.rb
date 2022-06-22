class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @group = Group.new
    @groups = Group.page(params[:page]).per(10)
  end

  def show
    @groups = Group.all
    @group = Group.find(params[:id])
    customer_all = Customer.where(is_deleted: true)
    @children = @group.children.where.not(customer: customer_all).page(params[:page]).per(10)
  end

  def create
    @group = Group.new(group_params)
    @groups = Group.all
    if @group.save
      flash[:notice]="新規登録しました"
    else
       @groups = Group.all
       render :index
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
       flash[:notice] = "クラスを変更しました"
       redirect_to admin_groups_path
    else
       flash[:notice] = "クラス名を入力してください"
       render :edit
    end
  end

  def destroy
    @group =  Group.find(params[:id])
    @group.delete
    @groups = Group.all
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
