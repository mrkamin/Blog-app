class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(current_user, @comment.post)
    else
      render :create
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  private :comment_params
end
