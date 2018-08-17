class UsersController < ApplicationController
  before_action :find_user, except: :index
  
  def show
    per_page = params[:page]
    @reviews = @user.reviews.order(created_at: :desc).page(per_page).per 4
  end
  
  def reviews
    @reviews = @user.reviews.order(created_at: :desc)
      .page(params[:page]).per(10)
  end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def index
        # @users = User.all
        @q = User.ransack(params[:q])
        @users = @q.result(distinct: true)
  end
  def show
      @user = User.find(params[:id])
  end
  def search
      @q = User.search(search_params)
      @users = @q.result(distinct: true)
  end

  private
  def search_params
      params.require(:q).permit!
  end

  def find_user
    @user = User.find_by id: params[:id]

    return if @user.present?
    flash[:danger] = "User not found"
    redirect_to root_path
  end
end
