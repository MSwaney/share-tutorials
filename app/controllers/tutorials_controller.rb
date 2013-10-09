class TutorialsController < ApplicationController
  
  before_action :authorize, only: [:new, :create]

  def index
    @tutorials = Tutorial.sort_order
  end

  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = current_user.tutorials.new(tutorial_params)
    if @tutorial.save
      flash[:notice] = "Good job"
      redirect_to '/'
    else
      render 'new'
    end
  end

private
  
  def tutorial_params
    params.require(:tutorial).permit(:description, :link, :category_id, :user_id)
  end
end
