class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :load_parents

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

    if @post.save
      redirect_to board_topic_posts_url @board, @topic, @post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to board_topic_posts_url(@board, @topic)
  end
end
