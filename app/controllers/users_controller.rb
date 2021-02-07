class UsersController < ApplicationController

  before_action :search_user, only: [:index, :search]

  def index
    cookies.encrypted[:user_id]=current_user.id if user_signed_in?

    @user = current_user
    @users = User.all.order("created_at DESC")
    set_user_column
  end

  def create
    user = User.create(user_params)
    cookies.permanent.signed[:user_id] = user.id
  end
  
  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  def search
    @results = @p.result  # 検索条件にマッチした商品の情報を取得
  end

  private

  def user_params
    params.require(:user).permit(:text, :gender_id,
    :picture, :birth_place_id, :residence_id, :blood_type_id, :birth_date, :age, :profession, :hobby, :nickname).merge(user_id: current_user.id)
  end

  def search_user
    if params[:q] == nil
      @p = nil
      @p = User.ransack(params[:q]).permit(:picture)
    else
      params[:q][:gender_id_cont] = '' if params[:q][:gender_id_cont] == '0'
      params[:q][:birth_place_id_cont] = '' if params[:q][:birth_place_id_cont] == '0'
      params[:q][:residence_id_cont] = '' if params[:q][:residence_id_cont] == '0'
      params[:q][:blood_type_id_cont] = '' if params[:q][:blood_type_id_cont] == '0'
      @p = User.ransack(params[:q]).permit(:picture)  # 検索オブジェクトを生成
    end
  end

  def set_user_column
    @user_gender_id = User.select("gender_id").distinct
    @user_age = User.select("age").distinct
    @user_birth_place_id = User.select("birth_place_id").distinct
    @user_residence_id = User.select("residence_id").distinct
    @user_blood_type_id = User.select("blood_type_id").distinct
  end

end