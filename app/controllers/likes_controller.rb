class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(like_params)
    redirect_to '/'
  end

private

  def like_params
    params.require(:like).permit(:tutorial_id, :user_id)
  end

end
