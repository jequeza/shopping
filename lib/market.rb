class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor_obj)
    @vendors.push(vendor_obj)
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item_name)
    sellers = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        sellers << vendor if item.name == item_name
      end
    end
    sellers
  end

  def sorted_item_list
    @vendors.flat_map do |vendor|
      vendor.inventory.map do |item, amount|
        item.name
      end
    end.uniq.sort
  end

  def total_inventory
    inventory = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        if inventory[item]
          inventory[item][:quantity] += amount
        else
          inventory[item] = {quantity: amount, vendors: vendors_that_sell(item.name)}
        end
      end
    end
    inventory
  end
end