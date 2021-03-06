class PostsController < ApplicationController
  before_action :check_if_logged_in
  
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
      redirect_to posts_path
    end
    #flash[:message] = nil   
  end

  def edit
  	@post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    if params[:post][:file].present?
      response = Cloudinary::Uploader.upload params[:post][:file]
      #post_details = post_params()
      #post_details[:image_url] = response["url"]
      post.update :content => params[:post][:content], :image => params[:post][:image], :image_url => response["url"]
    end

  	#post = Post.find params[:id]
  	#post.update post_params
  	redirect_to posts_path
  end

  def destroy
  	post = Post.find params[:id]
  	post = post.destroy
  	redirect_to posts_path
  end

  def check_if_logged_in
    redirect_to login_path unless @current_user.present?
  end

  def like
    @post = Post.find params[:id]
    like = "liked"
    render :like
  end

  private
  def post_params
  	params.permit(:title, :image, :content, :user_id, :image_url, :like, :like_count)
  end

end
