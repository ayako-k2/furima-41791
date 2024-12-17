class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :redirect, only: [:edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
    @items.each do |item|
      item.purchased = Purchase.exists?(item_id: item.id)
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      
      if @item.save
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
  end

  def show
    @item.purchased = Purchase.exists?(item_id: @item.id) 
    if @item.purchased
      redirect_to items_path
    else
    @user = @item.user
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
    render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :deliveryfee_id, :prefecture_id, :shipdate_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect
    if current_user.id != @item.user_id || Purchase.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

end
