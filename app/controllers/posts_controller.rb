class PostsController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @post = @place.posts.new
  end

  def create
    @place = Place.find(params[:place_id])
    @post = @place.posts.new(post_params)
    if @post.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :posted_on)
  end
end
