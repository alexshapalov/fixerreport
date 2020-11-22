require 'date'

class Report
  API_URL = "http://127.0.0.1:3088/api/v1/data/".freeze

  def initialize(document_format)
    @day = Date.today - 1 
    @document_format = document_format
    @arr_with_delta = []
  end

  def generate
    @document_format.generate(@day, find_delta(@day), get_rate_for_day(@day))
  end

  private

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
  
  def find_delta(day)
    get_rate_for_day = get_rate_for_day(day)

    dates.each do |day|
      delta = get_rate_for_day - get_rate_for_day(day)
      @arr_with_delta << delta
    end
    @arr_with_delta
  end
end
