class SchedulesController < ApplicationController
  before_action :find_schedule, only: [:show, :edit, :update, :destroy]

  def create
      @table = Table.find(params[:table_id])
      @schedule = Schedule.create(schedule_params)
      @schedule.table_id = @table.id

      if @schedule.save
        redirect_to table_path(@table)
      end
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedules_path
    else
      render 'edit'
    end
  end

  def destroy
    @table = Table.find params[:table_id]
    @schedule = @table.schedules.find params[:id]
    @schedule.destroy
    redirect_to table_path(@table)
  end

  private
  def schedule_params
    params.require(:schedule).permit(:day, :period, :teacher_id, :group_id, :subject_id, :audience_id, :table_id)
  end

  def find_schedule
    @schedule = Schedule.find(params[:id])
  end

end
