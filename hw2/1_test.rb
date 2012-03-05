require "./1.rb"
require "rubygems"
gem "test-unit"
require "test/unit"

class ValidPalindromeTest
  include Enumerable

  def initialize(limit, num)
    @limit, @num = limit, num
  end

  def each
    @num.times { yield(rand * @limit).floor }
  end
end

class TestAssertion < Test::Unit::TestCase
  def test_currency
    assert_equal 5.dollars, 5
    assert 10.dollars.in(:euros).between?(7.7, 7.8)
    assert_equal 10.euros.in(:dollars), 12.92
    assert_equal 10.euros.in(:rupees), 680
    assert 10.dollar.in(:rupees).between?(526.3, 526.4)
    assert 10.rupees.in(:euro).between?(0.14, 0.15)
    assert 10.rupees.in(:yen).between?(14.61, 14.62)
    assert_equal 10.euros.in(:rupees), 680
    assert 10.yen.in(:euros).between?(0.1006, 0.1007)
    assert 5.rupees.in(:yen).between?(7.2, 7.4)
  end

  def test_palindrome
    assert !"foo".palindrome?
    assert "A man, a plan, a canal -- Panama".palindrome?
    assert "Madam, I'm Adam!".palindrome?
    assert !"Abracadabra".palindrome?
  end

  def test_enumerables
    assert [1, 2, 3, 2, 1].palindrome?
    assert ![1, 2, 3, 2, 3].palindrome?
    assert ["s" => 1].palindrome?
    assert !%w{one two three}.palindrome?
    assert %w{a b c b a}.palindrome?
    assert !%w{a b c b d}.palindrome?
    assert [:a, :b, :a].palindrome?
    assert ![:a, :b, :c].palindrome?
    assert !{"hello" => "world"}.palindrome?
    assert !(1..2).palindrome?
    assert ValidPalindromeTest.new(1,9).palindrome?
  end
end