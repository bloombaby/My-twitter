class TweetsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_tweet, only:[:show, :edit, :update]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet,
                      notice: 'You just Tweeted!'}
      else
        format.html { render :new}
      end
    end
  end

  def show

  end

  def edit

  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet,
                                  notice: 'Your tweet has been updated.' }
      else
        format.html { render :edit}
      end
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end
end
