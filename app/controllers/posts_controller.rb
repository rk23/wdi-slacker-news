class PostsController < ApplicationController
  before_action :is_authenticated?

  def index
    @post = Post.all.sort_by{|x| x.total_votes}.reverse
  end

  def show
    @post = Post.find params[:id]
    @comments = @post.comments
  end

  def new
  end

  def create
    @post = @current_user.posts.create(post_params)

    if @post.save
      flash[:success] = "Post created"
      redirect_to root_path
    else
      flash[:danger] = "Error: post not created"
      redirect_to root_path
    end
  end

  def destroy
    result = Post.destroy params[:id]
    respond_to do |format|
      format.html {redirect_to :posts}
      format.json {render json: result}
    end
  end

  def vote
    @post = Post.find(params[:id])
    vote = Vote.create(voteable: @post, user: current_user, vote: params[:vote])
      if vote.valid?
        flash[:notice] = "Your vote was counted."
      else
        flash[:error] = "You can only vote once."
      end
    redirect_to :back
end


  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

end
