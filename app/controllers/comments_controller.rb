class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    # Additional code for initializing any required variables
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(current_user, @comment.post)
    else
      render :new
    end
  end

  private

  def comment_params
    # Define the permitted parameters for the comment
    params.require(:comment).permit(:content)
  end
end
