class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
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

  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id, :sales_status_id, :shipping_cost_id, :shipping_area_id,
                                 :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
