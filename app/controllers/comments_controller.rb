class CommentsController < ApplicationController
  def show
    @post = Post.find params[:id]
    @comments = @post.comments
  end

  def create
    @post = Post.find params[:id]
    @comment = @post.comments.create comment_params
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to "/show/" + params[:id]
    else
      flash[:danger] = "No success"
      redirect_to "/"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
