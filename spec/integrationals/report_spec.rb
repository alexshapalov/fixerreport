require 'spec_helper'

RSpec.describe Report do
  describe 'Genarate reports for all formats' do
    it 'CSV report' do 
      csv = CsvReport.new
      Report.new(document_format: csv).generate

      csv_file = File.read("././reports/2020-11-16.csv")

      expected_file_content = "today,yesterday delta,7 days ago delta,1 month ago delta,1 year ago delta,rate today\n2020-11-16,0.0004729999999999457,0.0017059999999999853,0.012512999999999996,0.07888300000000004,1.184013\n"
      
      expect(csv_file).to eq(expected_file_content)
    end

    it 'HTML report' do 
      html = HtmlReport.new
      Report.new(document_format: html).generate

      html_file = File.read("././reports/2020-11-16.html")

      expected_file_content = "<HTML><BODY>\n<h4>today: 2020-11-16, </h4>\n<h4>yesterday: 0.0004729999999999457, </h4>\n<h4>7 days ago delta: 0.0017059999999999853, </h4>\n<h4>1 month ago delta: 0.012512999999999996, </h4>\n<h4>1 year ago delta: 0.07888300000000004, </h4>\n<h4>rate today: 1.184013, </h4>\n</BODY></HTML>\n"
      
      expect(html_file).to eq(expected_file_content)
    end

    it 'JSON report' do 
      json = JsonReport.new
      Report.new(document_format: json).generate

      json_file = File.read("././reports/2020-11-16.json")

      expected_file_content = "{\"today\":\"2020-11-16\",\"yesterday\":0.0004729999999999457,\"7 days ago delta\":0.0017059999999999853,\"1 month ago delta\":0.012512999999999996,\"1 year ago delta\":0.07888300000000004,\"rate today\":1.184013}"

      expect(json_file).to eq(expected_file_content)
    end

    xit 'XLS report' do 
      xlsx = XlsReport.new
      Report.new(document_format: xlsx).generate

      xls_file = File.read("././reports/2020-11-16.xlsx")

      expected_file_content = xls_file.worksheet(0)
      
      expect(xls_file).to eq(expected_file_content)
    end
  end
end
