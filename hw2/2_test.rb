require "./2.rb"
require "rubygems"
gem "test-unit"
require "test/unit"

class TestAssertion < Test::Unit::TestCase
  def test_product
    result = []
    c = CartesianProduct.new([:a, :b], [4, 5])
    c.each { |elt| result.push elt }
    assert_equal result, [[:a, 4], [:a, 5], [:b, 4], [:b, 5]]

    result = []
    c = CartesianProduct.new([:a, :b], [])
    c.each { |elt| result.push elt }
    assert_equal result, []

    result = []
    c = CartesianProduct.new([:a, :b, :c], [4, 5])
    c.each { |elt| result.push elt }
    assert_equal result, [[:a, 4], [:a, 5], [:b, 4], [:b, 5], [:c, 4], [:c, 5]]
  end
end