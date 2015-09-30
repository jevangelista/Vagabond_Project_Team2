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
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
