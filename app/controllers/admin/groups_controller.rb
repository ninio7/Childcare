class Admin::GroupsController < ApplicationController
  def index
    @group = Group.new
    @groups = Group.all
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:notice]="新規登録しました"
      redirect_to admin_groups_path
    else
       @groups = Group.all
       render :index
    end
  end



  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
       flash[:notice] = "クラスを変更しました"
       redirect_to admin_groups_path
    else
       flash[:notice] = "クラス名を入力してください"
       render :edit
    end
  end

   def destroy
   @group =  Group.find(params[:id])
   @group.destroy
   redirect_to admin_groups_path
   end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
