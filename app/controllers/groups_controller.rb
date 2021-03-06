class GroupsController < ApplicationController
  before_action :find_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  def index
    @groups = Group.all.sort_by { |e| e.name  }
  end

  def new
    @group = Group.new
  end

  def edit

  end

  def create
    @error = ""
    @group = Group.new(group_params)
    @try = Group.find_by name: @group.name
    if @group.name != ""
      if @try != nil
        @error = "Такая группа уже есть!"
        render 'new'
        return
      end
      if @group.save
        redirect_to groups_path
      else
        render 'new'
      end
    else
      @error = "Поле не может быть пустым!"
      render 'new'
    end
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render 'edit'
    end
  end

  def destroy
    schedules = Schedule.all
    schedules.each do |e|
      if e.group_id == @group.id
        e.destroy
      end
    end
    @table = Table.find_by group_id: @group.id
    if @table != nil
      @table.destroy
    end
    @group.destroy
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

  def find_group
    @group = Group.find(params[:id])
  end

end
