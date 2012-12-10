class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  def index
    @tags = Post.tag_counts_on(:tags)
    @posts = if params[:tag]
              Post.tagged_with(params[:tag])
            else
              Post.all
            end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      redirect_to @post, :notice => "Successfully created post."
    else
      render :action => 'new'
    end
  end
end
