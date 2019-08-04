class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      redirect_to tweets_path
    else
      message =  {error: tweet.errors.full_messages.to_sentence}
      redirect_to new_tweet_path, flash: message
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
