class UsersController < ApplicationController


  def index
    @users = User.all
    render :index
  end

  def new 
    @user = User.new #creates article instance for form
    render :new #renders form
  end

  def create
    new_user = params.require(:user).permit(:email, :password_digest, :first_name, :last_name, :current_city)
    @user = User.create(new_user) #magically being inserted in database
    redirect_to "/users/#{@user.id}"
  end

  def show 
    id= params[:id]
    @user = User.find(id)
    render :show
  end

end
