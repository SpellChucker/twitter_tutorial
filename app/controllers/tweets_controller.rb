class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
  end

  def create
    if params[:tweet][:body].size == 0
      flash[:alert] = "Tweet must have some substance!"
    else
      tweet = Tweet.new(body: params[:tweet][:body], user_id: 1)
      if tweet.save
        redirect_to root_path
      else
        flash[:alert] = "Couldn't Save!"
      end
    end
  end

  def show
    @tweet = get_tweet
    @comment = Comment.new
  end

  private
  def get_tweet
    Tweet.find(params[:id])
  end
end
