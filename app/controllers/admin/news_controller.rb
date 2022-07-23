class Admin::NewsController < ApplicationController
  before_action :authenticate_admin!, except: [:show, :index]
  before_action :is_login?, only: [:show, :index]

  def index
    if current_admin.present?
      @news = News.page(params[:page]).per(10).reverse_order
    else
      group_ids = current_customer.children.pluck(:group_id).uniq
      @news = News.joins(:groups).where(groups: { id: group_ids }).page(params[:page]).per(10).reverse_order
    end
  end

  def new
    @news = News.new
  end

  def show
    @news = News.find(params[:id])
    @news_groups = @news.groups
    if !current_admin.present? && !@news_groups.where(id: current_customer.id).present?
      redirect_to notifications_path
    end
  end

  def create
    @news = News.new(news_params)
    @news.admin_id = current_admin.id
    if @news.save
       @news.groups.map(&:customers).flatten.uniq.each do |customer|
         @news.create_notification_by_admin(current_admin, customer)
      # @news.groups.each do |group|
      #   group.customers.each do |customer|
      # @news.create_notification_by_admin(current_admin, customer)
      #   end
       end
       flash[:notice]="新規登録しました"
       redirect_to admin_news_index_path
    else
       render :new
    end
  end

  def destroy
    @news =  News.find(params[:id])
    @news.destroy
    redirect_to admin_news_index_path
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      flash[:notice] = "お知らせを変更しました"
      redirect_to admin_news_index_path
    else
      render :edit
    end
  end

  private

  def news_params
    params.require(:news).permit(:admin_id, :started_on, :finished_on, :title, :body, { group_ids: [] })
  end

  def is_login?
    if !current_customer.present? && !current_admin.present?
      redirect_to customer_session_path
    end
  end

end
