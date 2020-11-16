require 'spreadsheet'

class XlsReport
  def generate(day, arr_with_delta, get_rate_for_day)
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet(:name => 'Report')

    sheet1.row(0).concat ["today", "yesterday delta", "7 days ago delta", "1 month ago delta", "1 year ago delta", "rate today"]
    sheet1.row(1).concat [day.to_s, arr_with_delta[0].to_s, arr_with_delta[1].to_s, arr_with_delta[2].to_s, arr_with_delta[3].to_s, get_rate_for_day.to_s]
  
    book.write('reports/' + "#{day}" + '.xlsx')
  end
end
