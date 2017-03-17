class SubjectsController < ApplicationController
  before_action :find_subject, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  def index
    @subjects = Subject.all.sort_by { |e| e.name  }
  end

  def new
    @subject = Subject.new
  end

  def edit

  end

  def show
    @count = 1
    @schedules = Schedule.where(subject_id: @subject.id)
  end

  def create
    @error = ""
    @subject = Subject.new(subject_params)
    @try = Subject.find_by name: @subject.name
    if @subject.name != ""
      if @try != nil
        @error = "Такой предмет уже есть!"
        render 'new'
        return
      end
      if @subject.save
        redirect_to subjects_path
      else
        render 'new'
      end
    else
      @error = "Поле не может быть пустым!"
      render 'new'
    end
  end

  def update
    if @subject.update(subject_params)
      redirect_to subjects_path
    else
      render 'edit'
    end
  end

  def destroy
    schedules = Schedule.all
    schedules.each do |e|
      if e.subject_id == @subject.id
        e.destroy
      end
    end
    @subject.destroy
    redirect_to subjects_path
  end

  private
  def subject_params
    params.require(:subject).permit(:name)
  end

  def find_subject
    @subject = Subject.find(params[:id])
  end

end
