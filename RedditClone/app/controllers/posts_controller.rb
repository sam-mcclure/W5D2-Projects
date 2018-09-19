class PostsController < ApplicationController
  before_action :require_signed_in
  before_action :require_author, only: [:edit, :update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # @post.sub_id = params[:sub_id]
    @post.author_id = current_user.id

    if @post.save
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def require_author
    @post = Post.find(params[:id])
    if @post.author_id != current_user.id
      flash[:errors] = ['You are not the author of this post']
      redirect_to post_url(@post)
    end
  end

  def edit
    @post = Post.find(params[:id])
    @subs = Sub.all

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to sub_url(@post.sub_url)
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
