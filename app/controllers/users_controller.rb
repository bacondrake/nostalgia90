class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show, :destroy]
  before_action :correct_user, only: [:edit]
  # before_action :admin_user, only: [:destroy, :new, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Account has been updated"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Your profile has been deleted"
    unless logged_in_user
      redirect_to signup_path
    else
      redirect_to users_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :phone, :email, :password,
      :password_confirmation, :admin)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "You must log in to view this page"
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Use when needing admin user.
      # Confirms an admin user.
      def admin_user
        unless current_user.admin?
          redirect_to(root_url)
          flash[:danger] = "You do not have permission to view that page"
        end
      end
end
