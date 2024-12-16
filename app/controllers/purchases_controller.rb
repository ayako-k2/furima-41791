class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :show]
  before_action :check_owner, only: [:index, :create, :show]
  

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create    
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid? 
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
  end

  private
  
  

  def purchase_address_params
    params.require(:purchase_address).permit(:postalcode, :prefecture_id, :city, :address, :building_name, :tel).merge(user_id:current_user.id, item_id: params[:item_id])
  end  

  def set_item
    @item = Item.find(params[:item_id])
  end


  def check_owner
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end
  
end
