class Report
  def self.get_rate_for_day(date)
    uri = URI("http://127.0.0.1:3088/api/v1/data/#{date}/EUR")

    res = Net::HTTP.get_response(uri)
    body = JSON.parse(res.body)

    body["rates"]["USD"]
  end

  def self.generate(day, format)
    dates = [
      Date.today.prev_day,
      Date.today.prev_day(7),
      Date.today.prev_month,
      Date.today.prev_year
    ]

    get_rate_for_day = get_rate_for_day(day)

    arr_with_delta = []
    dates.each do |day|
      delta = get_rate_for_day - get_rate_for_day(day)
      arr_with_delta << delta
    end
    arr_with_delta

    CSV.open("reports/#{day}.csv", "wb") do |csv|
      csv << ["today", "yesterday delta", "7 days ago delta", "1 month ago delta", "1 year ago delta", "rate today"]
      arr_with_delta.each do |delta|
        csv << [day, delta, delta, delta, delta, get_rate_for_day]
      end
    end
  end

  private 

  # def name
    
  # end
end

# # ReportFormat.new.formater(csv)

# class GenerateFormat 
  
# end