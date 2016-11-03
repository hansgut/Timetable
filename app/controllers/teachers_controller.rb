class TeachersController < ApplicationController
  before_action :find_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def edit

  end

  def create
      @teacher = Teacher.new(teacher_params)
      if @teacher.save
        redirect_to teachers_path
      else
        render 'new'
      end
  end

  def update
    if @teacher.update(teacher_params)
        redirect_to teachers_path
    else
      render 'edit'
    end
  end

  def destroy
    @teacher.destroy
    redirect_to teachers_path
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name)
  end

  def find_teacher
    @teacher = Teacher.find(params[:id])
  end
end
