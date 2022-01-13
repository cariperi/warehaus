class ItemsController < ApplicationController
  helper ItemHelper
  helper_method :sort_column, :sort_direction
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :set_min_max, only: :index

  def index
    @tags = selected_tags()
    @items = Item.order(sort_column + ' ' + sort_direction)
    @items = @items.with_tags(filter_params[:tags]) if filter_params[:tags]
    @items = @items.search_items(filter_params[:search]) if filter_params[:search]
    @items = @items.in_price_range(@min_price, @max_price) if (filter_params[:min_price] || filter_params[:max_price])
    @items = @items.is_available if filter_params[:in_stock]
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

  def filter_params
    params.permit(:min_price, :max_price, :search, :tags, :in_stock)
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

  def set_min_max
    @min_price =
      if filter_params[:min_price]
        filter_params[:min_price].tr("$.", "").to_i
      else
        Item.minimum(:price)
      end
    @max_price =
      if filter_params[:max_price]
        filter_params[:max_price].tr("$.", "").to_i
      else
        Item.maximum(:price)
      end
  end

  def selected_tags
    selected_tags = request.query_parameters["tags"] || []
    Tag.all.map do |tag|
      active = selected_tags.include?(tag.id.to_s)
      {text: tag.text, id: tag.id, active: active}
    end
  end
end
