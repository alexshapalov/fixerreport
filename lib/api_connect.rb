module ApiConnect
  API_URL = "http://127.0.0.1:3088/api/v1/data/".freeze

  def get_rate_for(date)
    uri = URI("#{API_URL}#{date}/EUR")
    res = Net::HTTP.get_response(uri)
    body = JSON.parse(res.body)
    
    body["rates"]["USD"]
  end
end