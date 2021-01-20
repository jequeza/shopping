class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item_obj)
    @inventory[item_obj]
  end

  def stock(item_obj, amount)
    @inventory[item_obj] += amount
  end

  def potential_revenue
    @inventory.sum do |item, amount|
      item.price * amount
    end
  end
end