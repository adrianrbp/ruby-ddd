module Logic
  class SnackMachine
    attr_reader :money_inside, :money_in_transaction

    def initialize(money_inside)
      @money_inside = money_inside
      @money_in_transaction = Money.new(0, 0, 0, 0, 0, 0)
    end

    def insert_money(money)
      @money_in_transaction = @money_in_transaction + money
    end

    def return_money
      # @money_in_transaction = 0
      @money_in_transaction = Money.new(0, 0, 0, 0, 0, 0)
    end

    def buy_snack
      @money_inside += @money_in_transaction
      # @money_in_transaction = 0
      @money_in_transaction = Money.new(0, 0, 0, 0, 0, 0)
    end
  end
end

