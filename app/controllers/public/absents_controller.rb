class Public::AbsentsController < ApplicationController
  def new
    @absent = Absent.new
    @date = Date.current.strftime('%Y年 %m月 %d日')
    @weekday = days[day]


  end

  def index
    @customer = current_customer
    @absents = Absent.all
    # @absents = current_customer.absents.page(params[:page])
    @absents_all_count = Absent.all.count
  end

  def show
    @absent = Absent.find(params[:id])
  end

  def create
  @absent = Absent.new(absent_params)
  @absent.customer_id = current_customer.id
    if @absent.save
      flash[:notice]="新規登録しました"
      redirect_to absents_path
    else
      @absents = absent.all
      render :index
    end
  end


  def edit
  end

  private

  def absent_params
    params.require(:absent).permit(:customer_id, :child_id, :admin_id, :kind, :started_on, :finished_on, :symptom, :note )
  end
end
