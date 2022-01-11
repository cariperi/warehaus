class ItemsController < ApplicationController
  helper ItemHelper
  helper_method :sort_column, :sort_direction
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order(sort_column + ' ' + sort_direction)
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

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_path, notice: "#{@item.name} deleted." }
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :quantity, :upc, :description, :price, :weight)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def sort_column
    Item.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
