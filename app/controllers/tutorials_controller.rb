class TutorialsController < ApplicationController
  
  before_action :authorize, only: [:new, :create]

  def index
    @tutorials = Tutorial.all
  end

  def new
    @tutorial = Tutorial.new
  end

  def create
    Tutorial.create(tutorial_params)
    redirect_to '/'
  end

private
  
  def tutorial_params
    params.require(:tutorial).permit(:description, :link)
  end
end
