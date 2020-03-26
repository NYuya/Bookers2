class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :corrent_user, only: [:edit, :update]

  def index
    @users = User.all
    @user = current_user
    @newbook = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @newbook = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end







  private
  def user_params
	 params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def corrent_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path
    end
  end

end
