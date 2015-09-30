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
    title = params[:title]
    @post = Post.find(params[:title])
    render :show
  end

  def edit
    @post = Post.find(params[:title])
  end

  def create
    new_post = params.require(:post).permit(:title, :content, :city_id)
    post = Post.create(new_post) #magically being inserted in database
    redirect_to "/posts/#{post.id}"
  end

  def update
    post_title = params[:title]
    post = Post.find(post_title)

    #get updated data
    updated_attributes = params.require(:post).permit(:title, :content)
    #update the article 
    post.update_attributes(updated_attributes)
    #redirect to show
    redirect_to "/posts/#{post_title}"
  end

  def destroy
    title = params[:title]
    post = Post.find(title)
    post.delete
    redirect_to "/posts"
  end
end