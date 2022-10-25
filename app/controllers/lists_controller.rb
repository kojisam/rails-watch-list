class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'List Saved'
    else
      render :new
    end
  end

  private

  def set_list
    @lists = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
