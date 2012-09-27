class TopicsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :load_parents

  def load_parents
    @board = Board.find(params[:board_id])
    if params[:id]
      @topic = @board.topics.find(params[:id]) || Topic.new
    else
      @topic = Topic.new
    end
  end

  def index
    redirect_to board_url(@board)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @topic = @board.topics.new(params[:topic])

    if @topic.save
      redirect_to @topic, notice: 'Topic was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @topic.update_attributes(params[:topic])
      redirect_to @topic, notice: 'Topic was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_url
  end
end
