require "./1.rb"
require "rubygems"
gem     "test-unit"
require "test/unit"

class TestAssertion < Test::Unit::TestCase
  def test_palindrome
    assert palindrome?("A man, a plan, a canal -- Panama")
    assert palindrome?("Madam, I'm Adam!")
    assert !palindrome?("Abracadabra")
  end

  def test_count_words
    assert_equal count_words("A man, a plan, a canal -- Panama"),
      {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
    assert_equal count_words("Doo bee doo bee doo"), {'doo' => 3, 'bee' =>2}
  end
end