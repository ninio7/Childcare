class Admin::NewsController < ApplicationController
  before_action :authenticate_admin!, except: [:show]
  def index
    @news = News.page(params[:page]).per(10).reverse_order
  end

  def new
    @news = News.new
  end

  def show
    @news = News.find(params[:id])
  end

  def create
    @news = News.new(news_params)
    @news.admin_id = current_admin.id
    if @news.save
       @news.group.customers.each do |customer|
        @news.create_notification_by_admin(current_admin, customer)
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

  private

  def news_params
    params.require(:news).permit(:admin_id, :group_id, :started_on, :finished_on, :title, :body)
  end

end
