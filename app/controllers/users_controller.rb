class UsersController < ApplicationController
  before_action :authenticate_user!

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



  before_action :correct_user, only: [:edit, :update]


  def edit
    @user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end







  private
  def user_params
	params.require(:user).permit(:name, :profile_image, :introduce )
  end
  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path
    end
  end

end
