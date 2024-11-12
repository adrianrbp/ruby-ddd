require 'minitest/autorun'
require_relative '../lib/logic/money'  # Make sure the Money class is in the file `money.rb`

class TestMoney < Minitest::Test
  def setup
    @money1 = Logic::Money.new(1, 2, 3, 4, 5, 6)
    @money2 = Logic::Money.new(1, 1, 1, 1, 1, 1)
  end

  def test_initialization
    assert_equal 1, @money1.one_cent_count
    assert_equal 2, @money1.ten_cent_count
    assert_equal 3, @money1.quarter_count
    assert_equal 4, @money1.one_dollar_count
    assert_equal 5, @money1.five_dollar_count
    assert_equal 6, @money1.twenty_dollar_count
  end

  def test_addition_operator
    sum_money = @money1 + @money2

    assert_equal 2, sum_money.one_cent_count
    assert_equal 3, sum_money.ten_cent_count
    assert_equal 4, sum_money.quarter_count
    assert_equal 5, sum_money.one_dollar_count
    assert_equal 6, sum_money.five_dollar_count
    assert_equal 7, sum_money.twenty_dollar_count
  end

  def test_addition_with_zero
    sum_money = @money1 + Logic::Money.new(0, 0, 0, 0, 0, 0)

    assert_equal @money1.one_cent_count, sum_money.one_cent_count
    assert_equal @money1.ten_cent_count, sum_money.ten_cent_count
    assert_equal @money1.quarter_count, sum_money.quarter_count
    assert_equal @money1.one_dollar_count, sum_money.one_dollar_count
    assert_equal @money1.five_dollar_count, sum_money.five_dollar_count
    assert_equal @money1.twenty_dollar_count, sum_money.twenty_dollar_count
  end
end
