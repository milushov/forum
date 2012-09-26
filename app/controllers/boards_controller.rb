class BoardsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @boards = Board.all

    respond_to do |format|
      format.html
      format.json { render json: @boards }
    end
  end

  def show
    @board = Board.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @board }
    end
  end

  def new
    @board = Board.new

    respond_to do |format|
      format.html
      format.json { render json: @board }
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def create
    @board = Board.new(params[:board])

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render json: @board, status: :created, location: @board }
      else
        format.html { render action: "new" }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @board = Board.find(params[:id])

    respond_to do |format|
      if @board.update_attributes(params[:board])
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy

    respond_to do |format|
      format.html { redirect_to boards_url }
      format.json { head :no_content }
    end
  end
end
