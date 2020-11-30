require_relative 'api_connect.rb'

class CalculateRate
  include ApiConnect

  def deltas(day)
    find_deltas(day)
  end

  private

  def find_deltas(day)
    get_rate_for_today = get_rate_for(day)

    @arr_with_delta = []
    dates.each do |next_day|
      delta = get_rate_for_today - get_rate_for(next_day)
      @arr_with_delta << delta
    end
    @arr_with_delta
  end

  def dates
    [
      Date.today.prev_day,
      Date.today.prev_day(6),
      Date.today.prev_month,
      Date.today.prev_year
    ]
  end
end