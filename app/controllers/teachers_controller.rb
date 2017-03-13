class TeachersController < ApplicationController
  before_action :find_teacher, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  def index
    @teachers = Teacher.all.sort_by { |e| e.name  }
  end

  def new
    @teacher = Teacher.new
  end

  def edit

  end

  def create
      @error = ""
      @teacher = Teacher.new(teacher_params)
      @try = Teacher.find_by name: @teacher.name
      if @teacher.name != ""
        if @try != nil
          @error = "Такой преподаватель уже есть!"
          render 'new'
          return
        end
        if @teacher.save
          redirect_to teachers_path
        else
          render 'new'
        end
      else
        @error = "Поле не может быть пустым!"
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
