class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to tutorial_path(@comment.tutorial)
    else
      flash[:notice] = "Please add your comment."
      redirect_to tutorial_path(@comment.tutorial)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted."
    redirect_to tutorial_path(:id => @comment.tutorial.id)
  end

private

  def comment_params
    params.require(:comment).permit(:content, :tutorial_id, :user_id)
  end
end
