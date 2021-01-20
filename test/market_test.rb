require "minitest/autorun"
require "minitest/pride"
require "./lib/item"
require "./lib/vendor"
require "./lib/market"

class MarketTest < Minitest::Test
  def test_it_exists_and_has_attributes
    market = Market.new("South Pearl Street Farmers Market")
    assert_instance_of Market, market
    assert_equal "South Pearl Street Farmers Market", market.name
    assert_equal [], market.vendors
  end

  def test_it_can_add_vendors
    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    vendor3 = Vendor.new("Palisade Peach Shack")
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)
    assert_equal [vendor1, vendor2, vendor3], market.vendors
  end
end