class Admin::AnnualPlansController < ApplicationController
  before_action :authenticate_admin!

  def new
    @annual_plan = AnnualPlan.new
    @group = Group.find(params[:group_id])
  end

  def index
    @annual_plans = AnnualPlan.page(params[:page]).per(10).reverse_order
    @group = Group.find(params[:group_id])
  end

  def show
    @annual_plan = AnnualPlan.find(params[:id])
  end

  def edit
    @annual_plan = AnnualPlan.find(params[:id])
    @group = Group.find(params[:group_id])
  end

  def create
    @annual_plan = AnnualPlan.new(annual_plan_params)
    @annual_plan.admin_id = current_admin.id
    if @annual_plan.save
      flash[:notice]="新規登録しました"
      redirect_to admin_group_annual_plans_path
    else
      render :new
    end
  end

  def update
    @annual_plan = AnnualPlan.find(params[:id])
    if @annual_plan.update(annual_plan_params)
      flash[:notice] ="年間指導計画を変更しました"
      redirect_to admin_group_annual_plans_path
    else
      render :edit
    end
  end

  private

  def annual_plan_params
    params.require(:annual_plan).permit(:admin_id, :group_id, :principal, :lead_teacher, :homeroom_teacher, :target, :safety, :evaluation, :first_act, :first_aim, :first_nursing, :first_education, :first_environment, :first_support, :first_event, :second_act, :second_aim, :second_nursing, :second_education, :second_environment, :second_support, :second_event, :third_act, :third_aim, :third_nursing, :third_education, :third_environment, :third_support, :third_event, :fourth_act, :fourth_aim, :fourth_nursing, :fourth_education, :fourth_environment, :fourth_support, :fourth_event)
  end
end
