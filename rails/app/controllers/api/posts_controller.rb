class Api::PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def create
    binding.pry
    newPost = Post.new(post_params)
    if newPost.save
      render json: newPost, status: :created
    else
      render json: newPost.errors, status: :unprocessable_entity
    end
  end

private
  def post_params
    params.require(:post).permit(:body)
  end
end
