class HtmlReport
  def generate(day, arr_with_delta, get_rate_for_day)
    fileHtml = File.new("reports/#{day}.html", "w+")
    fileHtml.puts "<HTML><BODY>"
    fileHtml.puts "<h4>today: #{day}, </h4>"
    fileHtml.puts "<h4>yesterday: #{arr_with_delta[0]}, </h4>"
    fileHtml.puts "<h4>7 days ago delta: #{arr_with_delta[1]}, </h4>"
    fileHtml.puts "<h4>1 month ago delta: #{arr_with_delta[2]}, </h4>"
    fileHtml.puts "<h4>1 year ago delta: #{arr_with_delta[3]}, </h4>"
    fileHtml.puts "<h4>rate today: #{get_rate_for_day}, </h4>"
    fileHtml.puts "</BODY></HTML>"
    fileHtml.close()
  end
end
