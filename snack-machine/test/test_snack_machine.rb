require 'minitest/autorun'
require_relative '../lib/logic/snack_machine'
require_relative '../lib/logic/money'

class SnackMachineTest < Minitest::Test
  def setup
    @initial_money = Logic::Money.new(1, 2, 3, 4, 5, 6)
    @snack_machine = Logic::SnackMachine.new(@initial_money)
  end

  def test_insert_money
    money_to_insert = Logic::Money.new(1, 1, 1, 1, 1, 1)

    @snack_machine.insert_money(money_to_insert)

    assert_equal 1, @snack_machine.money_in_transaction.one_cent_count
    assert_equal 1, @snack_machine.money_in_transaction.ten_cent_count
    assert_equal 1, @snack_machine.money_in_transaction.quarter_count
    assert_equal 1, @snack_machine.money_in_transaction.one_dollar_count
    assert_equal 1, @snack_machine.money_in_transaction.five_dollar_count
    assert_equal 1, @snack_machine.money_in_transaction.twenty_dollar_count
  end

  def test_return_money
    money_to_insert = Logic::Money.new(1, 1, 1, 1, 1, 1)
    @snack_machine.insert_money(money_to_insert)

    # Return the money and verify that the transaction is reset
    @snack_machine.return_money

    assert_equal 0, @snack_machine.money_in_transaction.one_cent_count
    assert_equal 0, @snack_machine.money_in_transaction.ten_cent_count
    assert_equal 0, @snack_machine.money_in_transaction.quarter_count
    assert_equal 0, @snack_machine.money_in_transaction.one_dollar_count
    assert_equal 0, @snack_machine.money_in_transaction.five_dollar_count
    assert_equal 0, @snack_machine.money_in_transaction.twenty_dollar_count
  end

  def test_buy_snack
    money_to_insert = Logic::Money.new(1, 1, 1, 1, 1, 1)
    @snack_machine.insert_money(money_to_insert)

    # Buy snack and check if the money is transferred correctly
    @snack_machine.buy_snack

    assert_equal 2, @snack_machine.money_inside.one_cent_count
    assert_equal 3, @snack_machine.money_inside.ten_cent_count
    assert_equal 4, @snack_machine.money_inside.quarter_count
    assert_equal 5, @snack_machine.money_inside.one_dollar_count
    assert_equal 6, @snack_machine.money_inside.five_dollar_count
    assert_equal 7, @snack_machine.money_inside.twenty_dollar_count

    # Ensure transaction is reset after buying snack
    assert_equal 0, @snack_machine.money_in_transaction.one_cent_count
    assert_equal 0, @snack_machine.money_in_transaction.ten_cent_count
    assert_equal 0, @snack_machine.money_in_transaction.quarter_count
    assert_equal 0, @snack_machine.money_in_transaction.one_dollar_count
    assert_equal 0, @snack_machine.money_in_transaction.five_dollar_count
    assert_equal 0, @snack_machine.money_in_transaction.twenty_dollar_count
  end
end
