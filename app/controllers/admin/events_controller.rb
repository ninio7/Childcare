class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!, only: [ :edit]

  def index
    @events = Event.all
    @event = Event.new
  end

  def create
    @event= Event.new(event_params)
    if @event.save
      flash[:notice]="新規登録しました"
       redirect_to admin_events_path
    else
       @events = Event.all
       render :index
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "イベントを変更しました"
      redirect_to admin_events_path
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :start_time)
  end

end
