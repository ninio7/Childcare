class Admin::PersonalPlansController < ApplicationController
  before_action :authenticate_admin!

  def new
    @personal_plan = PersonalPlan.new
    @group = Group.find(params[:group_id])
  end

  def index
    @group = Group.find(params[:group_id])
    @personal_plans = @group.personal_plans.page(params[:page]).per(10).reverse_order

  end

  def show
    @group = Group.find(params[:group_id])
    @personal_plan = PersonalPlan.find(params[:id])
  end

  def edit
    @group = Group.find(params[:group_id])
    @personal_plan = PersonalPlan.find(params[:id])
  end

  def create
    @personal_plan = PersonalPlan.new(personal_plan_params)
    @personal_plan.admin_id = current_admin.id
    if @personal_plan.save
      flash[:notice]="新規登録しました"
      redirect_to admin_group_personal_plans_path
    else
    render :new
    end
  end

  def update
    @personal_plan = PersonalPlan.find(params[:id])
    if @personal_plan.update(annual_plan_params)
      flash[:notice] ="年間指導計画を変更しました"
      redirect_to admin_group_personal_plans_path
    else
      render :edit
    end
  end

  private

  def personal_plan_params
    params.require(:personal_plan).permit(:admin_id, :group_id, :child_id, :principal, :lead_teacher, :homeroom_teacher, :act, :aim, :contents, :support, :evalution)
  end

end

