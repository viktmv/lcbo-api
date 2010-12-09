class Store < Sequel::Model

  plugin :timestamps, :update_on_create => true
  plugin :archive :crawl_id => [
    :is_hidden,
    :products_count,
    :inventory_count,
    :inventory_price_in_cents,
    :inventory_volume_in_milliliters].
    concat(Date::DAYNAMES.map { |day|
      [:"#{day.downcase}_open", :"#{day.downcase}_close"]
    }.flatten)

  many_to_one :crawl
  many_to_many :products, :join_table => :inventories

  def self.place(attrs)
    id = attrs[:store_id] || attrs[:store_no] || attrs[:id]
    if (store = where(:id => id).first)
      store.update_attributes(attrs)
    else
      create(attrs)
    end
  end

  def store_no=(value)
    self.id = value
  end

  def store_no
    id
  end

  def as_json
    { :store_no => store_no }.
      merge(super).
      exclude(:id, :is_hidden, :latrad, :lngrad)
  end

  def before_save
    super
    self.latrad = (self.latitude  * (Math::PI / 180))
    self.lngrad = (self.longitude * (Math::PI / 180))
  end

end
