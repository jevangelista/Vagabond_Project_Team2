class PostsController < ApplicationController
  def index
    @posts = Post.all # a list of all items in post table
    render :index
  end

  def new
    @post = Post.new #creates post instance for form
    render :new #renders form
  end

  def create
    post_params = params.require(:post).permit(:title, :content, :city_id)
    p "Create a Post!"
    @post = Post.create(post_params)

    redirect_to "/posts"
  end

  def show
  end

  def edit
  end



  def update
  end

  def destroy
  end
end
