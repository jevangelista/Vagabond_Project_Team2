class UsersController < ApplicationController


   def index
    @users = User.all
    render :index
   end

   def new
    @cities = City.all
    @user = User.new

    # @user.current_city = City.find_by id: 
    render :new
   end

   def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :city_id, :password, :created_at)
    p "CREATING A USER #{user_params}"
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

    def edit
      id = params[:id]
      @user = User.find(id)
      render :edit
    end

    def update
      user_id = params[:id]
      user = User.find(user_id)

      # get updated data
      updated_attributes = params.require(:user).permit(:first_name, :current_city)
      # update the user
      user.update_attributes(updated_attributes)

      #redirect to show
      redirect_to "/users/#{user.id}"  # <-- go to show
    end


    def posts
      p "IN USERS POSTS #{params}"
      @post = Post.find_by id: params[:id]
      @user = User.find_by_id(@post.user_id)
    end

    # def current_city(id)
    #   # p "*** In current_city method: #{params}"
    #   city = City.find_by id: id
    #   city.name
    # end
    # helper_method :current_city

  end
