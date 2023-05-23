class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @posts = Post.find(params[:id])
  end
end
