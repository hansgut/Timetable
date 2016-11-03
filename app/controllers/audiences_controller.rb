class AudiencesController < ApplicationController
  before_action :find_audience, only: [:show, :edit, :update, :destroy]

  def index
    @audiences = Audience.all
  end

  def new
    @audience = Audience.new
  end

  def edit

  end

  def create
      @audience = Audience.new(audience_params)
      if @audience.save
        redirect_to audiences_path
      else
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
