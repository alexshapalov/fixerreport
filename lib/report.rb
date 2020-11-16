require 'pry'

class Report
  API_URL = "http://127.0.0.1:3088/api/v1/data/".freeze

  def initialize(day, document_format)
    @day = day
    @document_format = document_format
    @arr_with_delta = []
  end

  def generate
    CsvReport.create_report(@day, find_delta(@day), get_rate_for_day(@day))
  end

  def find_delta(day)
    get_rate_for_day = get_rate_for_day(@day)

    dates.each do |day|
      delta = get_rate_for_day - get_rate_for_day(day)
      @arr_with_delta << delta
    end
    @arr_with_delta
  end

  def get_rate_for_day(date)
    uri = URI("#{API_URL}#{date}/EUR")
    res = Net::HTTP.get_response(uri)
    body = JSON.parse(res.body)

    body["rates"]["USD"]
  end

  def dates
    [
      Date.today.prev_day,
      Date.today.prev_day(7),
      Date.today.prev_month,
      Date.today.prev_year
    ]
  end
end

class CsvReport
  def self.create_report(day, arr_with_delta, get_rate_for_day)
    CSV.open("reports/#{day}.csv", "wb") do |csv|
      csv << ["today", "yesterday delta", "7 days ago delta", "1 month ago delta", "1 year ago delta", "rate today"]
      arr_with_delta.each do |delta|
        csv << [day, delta, delta, delta, delta, get_rate_for_day]
      end
    end
  end
end
