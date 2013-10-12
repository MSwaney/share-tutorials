class TutorialsController < ApplicationController
  
  before_action :authorize, only: [:new, :create]

  def index
    @tutorials = Tutorial.sort_order.page(params[:page])
  end

  def new
    @tutorial = Tutorial.new
  end

  def show
    @tutorial = Tutorial.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(:tutorial_id => params[:id]).sort_order
  end


  def create
    @tutorial = current_user.tutorials.new(tutorial_params)
    if @tutorial.save
      flash[:notice] = "Your tutorial has been added."
      render 'create.js'
    else
      render 'new.js'
    end
  end

private
  
  def tutorial_params
    params.require(:tutorial).permit(:description, :link, :category_id, :user_id)
  end
end
