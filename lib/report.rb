require 'date'
require_relative 'calculate_rate.rb'

class Report
  def initialize(document_format: format, calculate: CalculateRate.new)
    @today = Date.today
    @document_format = document_format
    @calculate = calculate
  end

  def generate
    @document_format.generate(@today, @calculate.deltas(@today), @calculate.get_rate_for(@today))
  end
end
