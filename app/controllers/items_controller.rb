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
      flash[:notice] = "#{item.name} item successfully created."
      redirect_to items_path
    else
      flash[:error] = item.errors
      render :new
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :quantity, :upc, :description, :price, :weight)
  end 
end 
