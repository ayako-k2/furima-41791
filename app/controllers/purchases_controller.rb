class PurchasesController < ApplicationController
  def index
    @items = Item.includes(:item)
  end

  def new
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
    
  end

  def create
  end
  
end
