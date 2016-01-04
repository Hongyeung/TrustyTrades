class CommentsController < ApplicationController

  def new
    @bid = Bid.find(params[:bid_id])
    @comment = Comment.new
  end

  def create
    comment_params = params.require(:comment).permit(:body)
    bid = Bid.find(params[:bid_id])
    @comment = Comment.new(comment_params)
    @comment.contractor = current_user
    @comment.bid = bid
    @comment.save
    redirect_to bid_comments_path(params[:bid_id])
  end

  def index
    @bid = Bid.find(params[:bid_id])
    @comment = Comment.new
  end
end
