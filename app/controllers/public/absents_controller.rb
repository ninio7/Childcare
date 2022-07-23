class Public::AbsentsController < ApplicationController
  before_action :authenticate_customer!,except: [:show]
  before_action :is_login?, only: [:show]

  def new
    @customer = current_customer
    @absent = Absent.new
  end

  def index
    @customer = current_customer
    @absents = current_customer.absents.page(params[:page]).per(10).reverse_order
  end

  def show
    @absent = Absent.find(params[:id])
    if !current_admin.present? && current_customer.id != @absent.customer_id
      redirect_to absents_path
    end
  end

  def create
  @absent = Absent.new(absent_params)
  @absent.customer_id = current_customer.id
  # 管理者は1人しか存在しないでfirstで1件のみを取得する
  target_admin = Admin.first
    if @absent.save
      @absent.create_notification_by_customer(current_customer, target_admin)
      flash[:notice]="新規登録しました"
      redirect_to absents_path
    else
       render :new
    end
  end

  def destroy
    @absent = Absent.find(params[:id])
    @absent.destroy
    redirect_to absents_path
  end


  private

  def absent_params
    params.require(:absent).permit(:customer_id, :child_id, :admin_id, :kind, :started_on, :finished_on, :symptom, :note )
  end

  def is_login?
    if !current_customer.present? && !current_admin.present?
      redirect_to customer_session_path
    end
  end

end
