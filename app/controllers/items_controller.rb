class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to_root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :deliveryfee_id, :prefecture_id, :shipdate_id, :price, :image).merge(user_id: current_user.id)
  end
end
