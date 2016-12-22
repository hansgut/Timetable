class SchedulesController < ApplicationController
  before_action :find_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
      @schedule = Schedule.new(schedule_params)
      if @schedule.save
        redirect_to schedules_path
      else
        render 'new'
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
    @schedule.destroy
    redirect_to schedules_path
  end

  private
  def schedule_params
    params.require(:schedule).permit(:day, :periond, :teacher_id, :group_id, :subject_id, :audience_id)
  end

  def find_schedule
    @schedule = Schedule.find(params[:id])
  end

end
