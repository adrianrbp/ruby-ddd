module Logic
  class SnackMachine
    attr_reader :one_cent_count, :ten_cent_count, :quarter_count,
                :one_dollar_count, :five_dollar_count, :twenty_dollar_count

    def initialize
      @one_cent_count = 0
      @ten_cent_count = 0
      @quarter_count = 0
      @one_dollar_count = 0
      @five_dollar_count = 0
      @twenty_dollar_count = 0
    end

    def insert_money(
        one_cent_count, 
        ten_cent_count, 
        quarter_count, 
        one_dollar_count, 
        five_dollar_count, 
        twenty_dollar_count
      )
      @one_cent_count += one_cent_count
      @ten_cent_count += ten_cent_count
      @quarter_count += quarter_count
      @one_dollar_count += one_dollar_count
      @five_dollar_count += five_dollar_count
      @twenty_dollar_count += twenty_dollar_count
    end
  end
end

