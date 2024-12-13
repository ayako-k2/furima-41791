class PurchasesController < ApplicationController
  def index
    @items = Item.includes(:item)
  end

  def new
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
    
  end

  def create
    @purchase = Purchase.create(purchase_params)
    Address.create(address_params)
  end

  private
  
  def purchase_params
    params.merge(user_id:current_user.id, item_id:@item.id)
  end

  def address_params
    params.permit(:postalcode, :prefecture_id, :city, :address, :building_name, :tel).merge(puchase_id: @purchase.id)
  end
end
