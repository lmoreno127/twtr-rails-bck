class TweetsController < ApplicationController

  def index
    @user=current_user
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def new
    @user=current_user
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.user=current_user
    if tweet.save 
      redirect_to tweets_path
    else
      message =  {error: tweet.errors.full_messages.to_sentence}
      redirect_to new_tweet_path, flash: message
    end
  end

  def show
    @user=current_user
  end  

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
