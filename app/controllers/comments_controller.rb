class CommentsController < ApplicationController
  def create
    Comment.create(body: params[:comment][:body],
                   user_id: session[:user_id],
                   tweet_id: params[:comment][:tweet_id])
    redirect_to tweet_path(params[:comment][:tweet_id])
  end
end
