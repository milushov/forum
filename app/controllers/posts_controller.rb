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
    @posts = @topic.posts
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def edit
  end

  def create
    @post = @topic.posts.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
