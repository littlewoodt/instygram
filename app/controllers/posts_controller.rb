class PostsController < ApplicationController
  def index
  	@posts = Post.order( :created_at ).reverse_order
  end

  def show
    @post = Post.find params[:id]
  end

  def new
  	@post = Post.new
  end

  def create
    if post_params[:image].present?
    	@post = Post.create post_params
      @current_user.posts << @post
    	redirect_to posts_path

    elsif params[:file].present?
      response = Cloudinary::Uploader.upload params[:file]

      post_details = post_params()
      post_details[:image_url] = response["url"]
      @post = Post.create post_details
      @current_user.posts << @post

      redirect_to posts_path
    else
      flash[:message] = "Cant be blank"
      redirect_to new_post_path
    end
    #flash[:message] = nil   
  end

  def edit
  	@post = Post.find params[:id]
  end

  def update
  	post = Post.find params[:id]
  	post.update post_params
  	redirect_to posts_path
  end

  def destroy
  	post = Post.find params[:id]
  	post = post.destroy
  	redirect_to posts_path
  end

  private
  def post_params
  	params.permit(:title, :image, :content, :user_id, :image_url, :like_count)
  end

end
