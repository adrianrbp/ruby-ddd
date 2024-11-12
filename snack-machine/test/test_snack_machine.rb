require 'minitest/autorun'
require_relative '../lib/logic/snack_machine'

class SnackMachineTest < Minitest::Test
  def setup
    @snack_machine = Logic::SnackMachine.new
  end

  def test_initial_counts_are_zero
    assert_equal 0, @snack_machine.one_cent_count
    assert_equal 0, @snack_machine.ten_cent_count
    assert_equal 0, @snack_machine.quarter_count
    assert_equal 0, @snack_machine.one_dollar_count
    assert_equal 0, @snack_machine.five_dollar_count
    assert_equal 0, @snack_machine.twenty_dollar_count

    assert_equal 0, @snack_machine.one_cent_count_in_transaction
    assert_equal 0, @snack_machine.ten_cent_count_in_transaction
    assert_equal 0, @snack_machine.quarter_count_in_transaction
    assert_equal 0, @snack_machine.one_dollar_count_in_transaction
    assert_equal 0, @snack_machine.five_dollar_count_in_transaction
    assert_equal 0, @snack_machine.twenty_dollar_count_in_transaction
  end

  def test_insert_money_increments_transaction_counts
    @snack_machine.insert_money(1, 2, 3, 1, 0, 1)

    assert_equal 1, @snack_machine.one_cent_count_in_transaction
    assert_equal 2, @snack_machine.ten_cent_count_in_transaction
    assert_equal 3, @snack_machine.quarter_count_in_transaction
    assert_equal 1, @snack_machine.one_dollar_count_in_transaction
    assert_equal 0, @snack_machine.five_dollar_count_in_transaction
    assert_equal 1, @snack_machine.twenty_dollar_count_in_transaction
  end

  def test_insert_money_multiple_times
    @snack_machine.insert_money(1, 1, 1, 1, 1, 1)
    @snack_machine.insert_money(2, 2, 2, 2, 2, 2)

    assert_equal 3, @snack_machine.one_cent_count_in_transaction
    assert_equal 3, @snack_machine.ten_cent_count_in_transaction
    assert_equal 3, @snack_machine.quarter_count_in_transaction
    assert_equal 3, @snack_machine.one_dollar_count_in_transaction
    assert_equal 3, @snack_machine.five_dollar_count_in_transaction
    assert_equal 3, @snack_machine.twenty_dollar_count_in_transaction
  end

  def test_return_money_resets_transaction_counts
    @snack_machine.insert_money(1, 2, 3, 4, 5, 6)
    @snack_machine.return_money

    assert_equal 0, @snack_machine.one_cent_count_in_transaction
    assert_equal 0, @snack_machine.ten_cent_count_in_transaction
    assert_equal 0, @snack_machine.quarter_count_in_transaction
    assert_equal 0, @snack_machine.one_dollar_count_in_transaction
    assert_equal 0, @snack_machine.five_dollar_count_in_transaction
    assert_equal 0, @snack_machine.twenty_dollar_count_in_transaction
  end
end
