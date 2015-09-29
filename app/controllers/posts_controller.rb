class PostsController < ApplicationController
  def index
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
