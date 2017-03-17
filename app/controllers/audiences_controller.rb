class AudiencesController < ApplicationController
  before_action :find_audience, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  def index
    @audiences = Audience.all.sort_by { |e| e.name  }
  end

  def new
    @audience = Audience.new
  end

  def edit

  end

  def create
    @error = ""
    @audience = Audience.new(audience_params)
    @try = Audience.find_by name: @audience.name
    if @audience.name != ""
      if @try != nil
        @error = "Такая аудитория уже есть!"
        render 'new'
        return
      end
      if @audience.save
        redirect_to audiences_path
      else
        render 'new'
      end
    else
      @error = "Поле не может быть пустым!"
      render 'new'
    end
  end

  def update
    if @audience.update(audience_params)
      redirect_to audiences_path
    else
      render 'edit'
    end
  end

  def destroy
    schedules = Schedule.all
    schedules.each do |e|
      if e.audience_id == @audience.id
        e.destroy
      end
    end
    @audience.destroy
    redirect_to audiences_path
  end

  private
  def audience_params
    params.require(:audience).permit(:name)
  end

  def find_audience
    @audience = Audience.find(params[:id])
  end

end
