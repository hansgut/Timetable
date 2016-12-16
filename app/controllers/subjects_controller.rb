class SubjectsController < ApplicationController
  before_action :find_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all.sort_by { |e| e.name  }
  end

  def new
    @subject = Subject.new
  end

  def edit

  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to subjects_path
    else
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
