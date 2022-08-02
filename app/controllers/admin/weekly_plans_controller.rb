class Admin::WeeklyPlansController < ApplicationController
  before_action :authenticate_admin!

  def new
    @weekly_plan = WeeklyPlan.new
    @group = Group.find(params[:group_id])
  end

  def index
    @weekly_plans = WeeklyPlan.page(params[:page]).per(10).reverse_order
    @group = Group.find(params[:group_id])
  end

  def show
    @weekly_plan = WeeklyPlan.find(params[:id])
  end

  def edit
    @weekly_plan = WeeklyPlan.find(params[:id])
    @group = Group.find(params[:group_id])
  end

  def create
    @weekly_plan = WeeklyPlan.new(weekly_plan_params)
    @weekly_plan.admin_id = current_admin.id
    if @weekly_plan.save
      flash[:notice]= "新規登録しました"
      redirect_to admin_group_weekly_plans_path
    else
      render :new
    end
  end

  def update
    @weekly_plan = WeeklyPlan.find(params[:id])
    if @weekly_plan.update(weekly_plan_params)
      flash[:notice] ="年間指導計画を変更しました"
      redirect_to admin_group_weekly_plans_path
    else
      render :edit
    end
  end

  private

  def weekly_plan_params
    params.require(:weekly_plan).permit(:admin_id, :group_id, :principal, :lead_teacher, :homeroom_teacher, :weeks, :lastweek_act, :aim, :event, :mon_act, :mon_support, :tue_act, :tue_support, :wed_act, :wed_support, :thu_act, :thu_support, :fri_act, :fri_support, :sat_act, :sat_support)
  end

end


