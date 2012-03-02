require "./4.rb"
require "rubygems"
gem     "test-unit"
require "test/unit"

class TestAssertion < Test::Unit::TestCase
  def test_dessert
    dessert = Dessert.new("yammy", 200)

    assert_equal dessert.name, "yammy"
    assert_equal dessert.calories, 200
    assert       dessert.delicious?
    assert       !dessert.healthy?

    dessert.calories = 100

    assert dessert.healthy?
  end

  def test_jellybean
    jellybean = JellyBean.new("Bean", 20, "orange")

    assert_equal jellybean.name, "Bean"
    assert_equal jellybean.calories, 20
    assert_equal jellybean.flavor, "orange"

    assert       jellybean.healthy?
    assert       jellybean.delicious?

    jellybean.flavor = "black licorice"

    assert       !jellybean.delicious?
  end
end