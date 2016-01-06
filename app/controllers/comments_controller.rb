class CommentsController < ApplicationController
  def show
    @comment = Comment.find params[:id]
  end

  def reply
    @comment = Comment.find params[:id]
    @new_comment = @comment.replies.create reply_params
    @new_comment.commentable_id = @comment.id
    @new_comment.user_id = current_user.id

    if @new_comment.save
      flash[:success] = "Success"
      redirect_to(:back)
    else
      flash[:danger] = "No success"
      redirect_to "/reply/" + params[:id]
    end
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
    params.require(:comment).permit(:body)
  end

  def reply_params
    params.require(:this).permit(:body)
  end
end
