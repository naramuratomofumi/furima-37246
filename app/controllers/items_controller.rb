class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  def index
  end

  def new
  end

  def create
    
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id, :sales_status_id, :sipping_cost_id, :shipping_area_id, :day_to_ship_id, :price, :image).marge(user_id:current_user.id)
  end
end
