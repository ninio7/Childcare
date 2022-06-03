class Public::ChildrenController < ApplicationController
  def index
    @children = Child.all
    @child = Child.new
  end

  def edit
    @child = Child.find(params[:id])
  end

  def create
    @child = Child.new(child_params)
    # @child.customer_id = current_customer.id
    if @child.save
      flash[:notice]="新規登録しました"
      redirect_to children_path
    else
       @children = Children.all
       render :index
    end
  end

  def update
    @child = Child.find(params[:id])
    if @child.update(child_params)
         flash[:notice]="登録内容を変更しました"
      redirect_to children_path
    else
       @children = Children.all
       render :index
    end
  end

private

  def child_params
    params.require(:child).permit(:name, :kana_name, :group_id, :birthday)
  end

end