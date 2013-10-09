class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.where(:slug => params[:id]).first
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(cat_params)
  end

private
  def cat_params
    params.require(:category).permit(:name)
  end
end
