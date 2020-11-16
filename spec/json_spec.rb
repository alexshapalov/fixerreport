require 'spec_helper'

RSpec.describe Report do
  describe 'Genarate reports for all formats' do
    let(:csv_file)  { "../reports/2020-11-16.csv" }
    let(:html_file) { "../reports/2020-11-16.html" }
    let(:json_file) { "../reports/2020-11-16.json" }
    let(:xls_file)  { "../reports/2020-11-16.xlsl" }
  
    it 'CSV report' do 
      csv = CsvReport.new

      document_format = csv
      Report.new(document_format).generate

      expect(csv_file).to be
    end

    it 'HTML report' do 
      csv = HtmlReport.new

      document_format = csv
      Report.new(document_format).generate

      expect(html_file).to be
    end

    it 'JSON report' do 
      csv = CsvReport.new

      document_format = csv
      Report.new(document_format).generate

      expect(json_file).to be
    end

    it 'XLS report' do 
      csv = XlsReport.new

      document_format = csv
      Report.new(document_format).generate

      expect(xls_file).to be
    end
  end
end
