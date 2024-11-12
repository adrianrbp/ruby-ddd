module Logic
  class Money
    # Money inside
    attr_reader :one_cent_count, :ten_cent_count, 
                :quarter_count, :one_dollar_count, 
                :five_dollar_count, :twenty_dollar_count
    def initialize(
      one_cent_count, ten_cent_count, 
      quarter_count, one_dollar_count,
      five_dollar_count, twenty_dollar_count
     )
      @one_cent_count = one_cent_count
      @ten_cent_count = ten_cent_count
      @quarter_count = quarter_count
      @one_dollar_count = one_dollar_count
      @five_dollar_count = five_dollar_count
      @twenty_dollar_count = twenty_dollar_count
    end

    def +(other_money)
      Money.new(
        @one_cent_count + other_money.one_cent_count,
        @ten_cent_count + other_money.ten_cent_count,
        @quarter_count + other_money.quarter_count,
        @one_dollar_count + other_money.one_dollar_count,
        @five_dollar_count + other_money.five_dollar_count,
        @twenty_dollar_count + other_money.twenty_dollar_count
      )
    end
  end
end