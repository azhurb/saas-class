require "./3.rb"
require "rubygems"
gem     "test-unit"
require "test/unit"

class TestAssertion < Test::Unit::TestCase
  def test_combine_anagrams
    assert_equal combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream']),
      [["cars", "racs", "scar"], ["for"], ["potatoes"], ["four"], ["creams", "scream"]]

    assert_equal combine_anagrams(['Cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream']),
       [["Cars", "racs", "scar"], ["for"], ["potatoes"], ["four"], ["creams", "scream"]]
  end
end