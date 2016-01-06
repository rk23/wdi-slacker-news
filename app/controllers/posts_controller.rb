class PostsController < ApplicationController
  before_action :is_authenticated?

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = @current_user.posts.create(post_params)

    @upvote = Vote.create
    @upvote.post_id = @post.id
    @upvote.value = 0

    if @post.save
      flash[:success] = "Post created"
      redirect_to root_path
    else
      flash[:danger] = "Error: post not created"
      redirect_to "/"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

end
