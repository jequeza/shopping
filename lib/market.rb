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
end