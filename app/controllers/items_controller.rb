class ItemsController < ApplicationController
  helper ItemHelper
  before_action :find_item, only: [:show, :edit, :update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: "#{@item.name} item successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_path, notice: "#{@item.name} item successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :quantity, :upc, :description, :price, :weight)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
