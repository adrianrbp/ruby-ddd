module Logic
  class SnackMachine
    # Money inside
    attr_reader :one_cent_count, :ten_cent_count, 
                :quarter_count, :one_dollar_count, 
                :five_dollar_count, :twenty_dollar_count
    # Money inserted by user
    attr_reader :one_cent_count_in_transaction, :ten_cent_count_in_transaction,
                :quarter_count_in_transaction, :one_dollar_count_in_transaction,
                :five_dollar_count_in_transaction, :twenty_dollar_count_in_transaction

    def initialize
      @one_cent_count = 0
      @ten_cent_count = 0
      @quarter_count = 0
      @one_dollar_count = 0
      @five_dollar_count = 0
      @twenty_dollar_count = 0

      @one_cent_count_in_transaction = 0
      @ten_cent_count_in_transaction = 0
      @quarter_count_in_transaction = 0
      @one_dollar_count_in_transaction = 0
      @five_dollar_count_in_transaction = 0
      @twenty_dollar_count_in_transaction = 0
    end

    def insert_money(
        one_cent_count, 
        ten_cent_count, 
        quarter_count, 
        one_dollar_count, 
        five_dollar_count, 
        twenty_dollar_count
      )
      @one_cent_count_in_transaction += one_cent_count
      @ten_cent_count_in_transaction += ten_cent_count
      @quarter_count_in_transaction += quarter_count
      @one_dollar_count_in_transaction += one_dollar_count
      @five_dollar_count_in_transaction += five_dollar_count
      @twenty_dollar_count_in_transaction += twenty_dollar_count
    end

    def return_money
      @one_cent_count_in_transaction = 0
      @ten_cent_count_in_transaction = 0
      @quarter_count_in_transaction = 0
      @one_dollar_count_in_transaction = 0
      @five_dollar_count_in_transaction = 0
      @twenty_dollar_count_in_transaction = 0
    end
  end
end

