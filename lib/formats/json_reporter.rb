require 'json'

class JsonReport
  def generate(day, arr_with_delta, get_rate_for_day)
    fileJson = File.new("reports/#{day}.json", "w+")

    generate_hash = { 
      today: day, 
      yesterday: arr_with_delta[0],
      "7 days ago delta": arr_with_delta[1],
      "1 month ago delta": arr_with_delta[2],
      "1 year ago delta": arr_with_delta[3],
      "rate today": get_rate_for_day
    }

    json = JSON.generate(generate_hash)
    fileJson.write(json)
    fileJson.close
  end
end