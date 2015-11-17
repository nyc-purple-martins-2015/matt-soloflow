class CommentsController < ApplicationController

  def create
    @user = current_user
    @comment = current_user.comments.new(comment_params)
    # http://api.rubyonrails.org/classes/ActionDispatch/Routing/PolymorphicRoutes.html
    # http://vicfriedman.github.io/blog/2013/11/14/the-difference-between-url-for-and-polymorphic-url/
    if @comment.save
      if @comment.commentable_type == "Answer"
        redirect_to question_path(@comment.commentable.question_id)
       else
        redirect_to question_path(@comment.commentable_id)
      end
    else
      redirect_to root_path
    end
  end

private

  def comment_params
    params.require(:comment).permit(:content, :commentable_type, :commentable_id)
  end
end

