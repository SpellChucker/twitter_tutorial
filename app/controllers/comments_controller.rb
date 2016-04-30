class CommentsController < ApplicationController
  def create
    Comment.create(body: params[:comment][:body],
                   user_id: 1,
                   tweet_id: params[:comment][:tweet_id])
    redirect_to tweet_path(params[:comment][:tweet_id])
  end
end
