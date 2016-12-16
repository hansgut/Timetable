class TablesController < ApplicationController
  before_action :find_table, only: [:show, :edit, :update, :destroy]

  def index
    @tables = Table.all
  end

  def new
    @table = Table.new
    @groups = Group.all.sort_by { |e| e.name  }
  end

  def show
    @table = find_table
    @elements = Schedule.where(table_id: @table.id).order(period: :asc, day: :desc)
  end

  def create
      @table = Table.new(table_params)
      if @table.save
        redirect_to tables_path
      else
        render 'new'
      end
  end

  def update
    if @table.update(table_params)
      redirect_to tables_path
    else
      render 'edit'
    end
  end

  def destroy
    @table.destroy
    redirect_to tables_path
  end

  private
  def table_params
    params.require(:table).permit(:name, :group_id)
  end

  def find_table
    @table = Table.find(params[:id])
  end

end