class CsvReport
  def generate(day, arr_with_delta, get_rate_for_day)
    CSV.open("reports/#{day}.csv", "wb") do |csv|
      csv << ["today", "yesterday delta", "7 days ago delta", "1 month ago delta", "1 year ago delta", "rate today"]
      csv << [day, arr_with_delta[0], arr_with_delta[1], arr_with_delta[2], arr_with_delta[3], get_rate_for_day]
    end
  end
end