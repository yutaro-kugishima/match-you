class UsersController < ApplicationController
  
  def index
    # @users = User.select(:nickname,:gender, :age, :residence)
    @users = User.all
    # @nickname = user.nickname
    # @tweets = user.tweets
    # @users = User.includes(:user).order("created_at DESC")
  end

  def create
    User.create(user_params)
  end
  
  def show
    @user = User.find(params[:id])
    # @nickname = @user.nickname
    # @tweets = @user.tweets
    # @comment = Comment.new
    # @comments = @user.comments.includes(:user)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  # def search
  #   # @users = User.search(params[:keyword])
  #   @users = User.search(params[:user_id])
  # end

  private

  def user_params
    params.require(:user).permit(:text, :gender,
    :picture, :birth_place, :residence, :blood_type, :birth_date, :age, :profession, :hobby, :nickname).merge(user_id: current_user.id)
  end
end