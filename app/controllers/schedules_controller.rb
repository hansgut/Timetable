class SchedulesController < ApplicationController
  before_action :find_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
    @groups = Group.all.sort_by { |e| e.name  }
    @teachers = Teacher.all.sort_by { |e| e.name }
    @audiences = Audience.all.sort_by {|e| e.name }
    @subjects = Subject.all.sort_by {|e| e.name }
    @tables = Table.all
    @days = (1..6).to_a
    @periods = (1..7).to_a
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
    params.require(:schedule).permit(:day, :periond, :teacher_id, :group_id, :subject_id, :audience_id, :table_id)
  end

  def find_schedule
    @schedule = Schedule.find(params[:id])
  end

end
