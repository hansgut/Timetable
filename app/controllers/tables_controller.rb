class TablesController < ApplicationController
  before_action :find_table, only: [:show, :edit, :update, :destroy]

  def index
    temp_tables = []
    Table.all.each do |e|
      temp = []
      temp << e
      temp << Group.all.find{|g| g.id == e.group_id}.name
      temp_tables << temp
    end
    @tables = temp_tables.sort_by{|e| e[1]}
  end

  def new
    @table = Table.new
    @groups = Group.all.sort_by { |e| e.name  }
  end

  def show
    @count = 1
    @table = find_table
    @group = @table.group_id
    @subjects = Subject.all.sort_by { |e| e.name  }
    @audiences = Audience.all.sort_by { |e| e.name  }
    @teachers = Teacher.all.sort_by { |e| e.name  }
    @schedules = Schedule.where(table_id: @table)
  end

  def create
      @table = Table.new(table_params)
      if @table.save
        redirect_to tables_path
      else
        render 'new'
      end
  end

  def destroy
    
    @table.destroy
    redirect_to tables_path
  end

  private
  def table_params
    params.require(:table).permit(:group_id)
  end

  def schedule_params
    params.require(:schedule).permit(:day, :periond, 0, 0, 0, 0, 0)
  end

  def find_table
    @table = Table.find(params[:id])
  end

end
