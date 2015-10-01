class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create, :update, :destroy]

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    end
    @cities = City.all
    render :index
  end

  def new
    p "POSTS.NEW PARAMS: #{params}"
    @post = Post.new #creates post instance for form
    @post.city_id = params[:format]
    p "@post.city_id = #{@post.city_id}"
    @user = current_user
    p "POSTS.NEW @user: #{@user.email}"
    @post.user_id = @user.id
    p "@post.user_id = #{@post.user_id}"
    render :new #renders form
  end

  def show
    id = params[:id]
    @post = Post.find(params[:id])
    render :show
  end

  def edit

    id = params[:id]
    @post = Post.find(params[:id])

  end

  def create
    p "POSTS.CREATE: #{params}"
    p "params[:post]: #{params[:post]}"
    p "params[:user_id]: #{params[:user_id]}"
# byebug
    new_post = params.require(:post).permit(:title, :content, :city_id, :all_tags)
    new_post[:user_id] = params[:user_id]
    p "** new_post #{new_post}"
    post = Post.create(new_post) #magically being inserted in database
    redirect_to "/posts/#{post.id}"
  end

  def update
    post_id = params[:id]
    post = Post.find(post_id)

    #get updated data
    updated_attributes = params.require(:post).permit(:title, :content)
    #update the article 
    post.update_attributes(updated_attributes)
    #redirect to show
    redirect_to "/posts/#{post_id}"
  end

  def destroy
    id = params[:id]
    post = Post.find(id)
    post.delete
    redirect_to "/posts"
  end

  private

    def require_login
      unless current_user
        redirect_to "/sign_in"
      end
  end
end