class UsersController < ApplicationController


   def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :current_city, :password, :created_at)
    @user = User.create(user_params)

    login(@user) # <-- login the user
    redirect_to "/users/#{@user.id}" 
  end

   def show
      id = params[:id]
      @user = User.find(id)
      @current_user = current_user
      render :show
    end

end
