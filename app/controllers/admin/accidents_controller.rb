class Admin::AccidentsController < ApplicationController
   before_action :authenticate_admin!

  def new
    @accident = Accident.new
    @group = Group.find(params[:group_id])
  end

  def index
    @group = Group.find(params[:group_id])
    @accidents = @group.accidents.page(params[:page]).per(10).reverse_order

  end

  def show
    @group = Group.find(params[:group_id])
    @accident = Accident.find(params[:id])
  end

  def edit
    @group = Group.find(params[:group_id])
    @accident = Accident.find(params[:id])
  end

  def create
    @accident = Accident.new(accident_params)
    @accident.admin_id = current_admin.id
    if @accident.save
      flash[:notice]="新規登録しました"
      redirect_to admin_group_accidents_path
    else
    render :new
    end
  end

  def update
    @accident = Accident.find(params[:id])
    if @accident.update(accident_params)
      flash[:notice] ="ヒヤリハットを変更しました"
      redirect_to admin_group_accidents_path
    else
      render :edit
    end
  end

  private

  def accident_params
    params.require(:accident).permit(:admin_id, :group_id, :principal, :lead_teacher, :homeroom_teacher, :place, :situation, :cause, :steps, :started_on)
  end

end
