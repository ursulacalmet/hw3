class PostsController < ApplicationController
    def new
      @place = Place.find(params[:place_id])
      @post = Post.new
    end
  
    def create
      @place = Place.find(params[:place_id])
      @post = @place.posts.create(post_params)
      redirect_to place_path(@place)
    end
  
    def show
        @post = Post.find(params[:id])
      end
      
    private
  
    def post_params
      params.require(:post).permit(:title, :description, :posted_on)
    end
  end


  
