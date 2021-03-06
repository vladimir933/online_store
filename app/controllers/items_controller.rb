class ItemsController < ApplicationController
  before_action :find_item, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :edit, :update]

  def index
    @items = Item.all.page(params[:page]).per(9)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to store_item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to store_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :kind, :description, :user_id, :price, :avatar, :delivery_time)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end