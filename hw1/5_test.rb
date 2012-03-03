require "./5.rb"
require "rubygems"
gem "test-unit"
require "test/unit"

class TestAssertion < Test::Unit::TestCase
  def test_history

    f = Foo.new
    f.bar = 1
    f.bar = 2

    assert_equal f.bar_history, [nil, 1, 2]
  end
end