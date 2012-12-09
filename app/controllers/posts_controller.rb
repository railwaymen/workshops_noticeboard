class PostsController < ApplicationController
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
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post, :notice => "Successfully created post."
    else
      render :action => 'new'
    end
  end
end
