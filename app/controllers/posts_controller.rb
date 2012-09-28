class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :load_parents
  load_and_authorize_resource

  def load_parents
    @board = Board.find(params[:board_id])
    @topic = @board.topics.find(params[:topic_id])
    if params[:id]
      @post = @topic.posts.find(params[:id]) || Post.new
    else
      @post = Post.new
    end
  end

  def index
    @posts = @topic.posts.page(params[:page]).per(5)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @post = @topic.posts.new(params[:post])
    @post.user = current_user
    @new_post = @post

    if @new_post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to board_topic_posts_url @board, @topic
    else
      flash[:error] = 'Post was not created.'
      redirect_to board_topic_posts_url @board, @topic
    end
  end

  def update
    @new_post = @post
    if @new_post.save
      flash[:notice] = 'Post was successfully updated.'
      redirect_to board_topic_posts_url @board, @topic
    else
      flash[:error] = 'Post was not updated.'
      redirect_to board_topic_posts_url @board, @topic
    end
  end

  def destroy
    @post.destroy
    redirect_to board_topic_posts_url(@board, @topic)
  end
end
