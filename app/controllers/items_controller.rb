class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new 
  end 

  def create
    item = Item.new(item_params)
    if item.valid?
      item.save
      flash[:success] = "#{item.name} item successfully created."
      redirect_to items_path
    else
      flash[:error] = item.errors
      redirect_to new_item_path
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :quantity, :upc, :description, :price, :weight)
  end 
end 
