class TopicsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :load_parents
  load_and_authorize_resource

  def load_parents
    @board = Board.find(params[:board_id])
    if params[:id]
      @topic = @board.topics.find(params[:id]) || Topic.new
    else
      @topic = Topic.new
    end
  end

  def index
    @topics = @board.topics.page(params[:page]).per(5)
  end

  def show
    redirect_to board_topic_posts_url(@board, @topic), notice: flash[:notice]
  end

  def new
  end

  def edit
  end

  def create
    post_text = params[:topic].delete :text
    @topic = @board.topics.new(params[:topic])
    @post = @topic.posts.new do |post|
      post.text = post_text
      post.user = current_user
    end

    text_ok = true
    unless (5..100).include?(post_text.length)
      text_ok = false
      @topic.errors.add('', 'text should be have minimum is 5 characters and is 1000 as maximum')
    end

    if @topic.save and @post.save and text_ok
      flash[:notice] = 'Topic was successfully created.'
      redirect_to [@board, @topic]
    else
      render action: 'new'
    end
  end

  def update
    post_text = params[:topic].delete :text
    @post = @topic.posts.first
    @post.text = post_text

    if @topic.update_attributes(params[:topic]) and @post.save
      redirect_to [@board, @topic], notice: 'Topic was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to board_topics_url @board
  end
end
