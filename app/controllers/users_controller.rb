class UsersController < ApplicationController

  before_action :search_user, only: [:index, :search]
  
  def index
    @users = User.all.order("created_at DESC")
    set_user_column
  end

  # def new
  #   @messages = Message.all
  #   @message = Message.new
  # end

  def create
    User.create(user_params)
    @messages = Message.all
    # @message = Message.new
    @message = Message.new(text: params[:message][:text])
  end
  
  def show
    @user = User.find(params[:id])
    # binding.pry
    # @comment = Comment.new
    # @comments = @user.comments.includes(:user)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  def search
    @results = @p.result.includes(:user)  # 検索条件にマッチした商品の情報を取得
  end

  private

  def user_params
    params.require(:user).permit(:text, :gender_id,
    :picture, :birth_place_id, :residence_id, :blood_type_id, :birth_date, :age, :profession, :hobby, :nickname).merge(user_id: current_user.id)
  end

  def search_user
    @p = User.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def set_user_column
    @user_gender_id = User.select("gender_id").distinct
    @user_age = User.select("age").distinct
    @user_birth_place_id = User.select("birth_place_id").distinct
    @user_residence_id = User.select("residence_id").distinct
    @user_blood_type_id = User.select("blood_type_id").distinct
  end

end