class PostsController < ApplicationController
  def index
    @posts = Post.all # a list of all items in post table
    render :index
  end

  def new
    @post = Post.new #creates post instance for form
    render :new #renders form
  end

  def show
    id = params[:id]
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    new_post = params.require(:post).permit(:title, :content)
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
end