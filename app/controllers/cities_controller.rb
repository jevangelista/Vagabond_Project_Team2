class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    id = params[:id]
    @city = City.find(id)
    @post.all_tags = @post.all_tags}
  end

  # def posts
  #    p params
  #    @post = Post.find_by title: params[:id]
  #    @user = City.find_by_id(@post.user_id)
  # end

end
