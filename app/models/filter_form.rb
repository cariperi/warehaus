class FilterForm
  include ActiveModel::Model

  attr_accessor :search, :tags, :min_price, :max_price, :in_stock

  def initialize(params={})
    @search = params[:search]
    @tags = build_tags(params[:tags] || [])
    @min_price = params[:min_price] || Item.minimum(:price)
    @max_price = params[:max_price] || Item.maximum(:price)
    @in_stock = params[:in_stock] == "true" ?  true : false
  end

  def active_tags
    @tags.filter_map { |t| t[:id] if t[:active] == true }
  end

  def has_prices?
    @min_price.present? || @max_price.present?
  end

  private
  def build_tags(ids)
    Tag.all.map do |tag|
      active = ids.include?(tag.id.to_s)
      {text: tag.text, id: tag.id, active: active}
    end
  end
end
