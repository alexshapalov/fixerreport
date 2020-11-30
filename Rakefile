#!/usr/bin/env rake

require 'net/http'

require_relative 'lib/report'
require_relative 'lib/formats/csv_reporter'
require_relative 'lib/formats/json_reporter'
require_relative 'lib/formats/html_reporter'
require_relative 'lib/formats/xls_reporter'

desc "generate a report on currency development"
task :generate_report do
  if ENV['DOCUMENT_FORMAT'].empty?
    puts "Please chose the right format"
  else 
    document_format = ENV['DOCUMENT_FORMAT'].to_sym

    formats = {
      csv: CsvReport.new,
      html: HtmlReport.new,
      xlx: XlsReport.new,
      json: JsonReport.new,
    }
    format = formats[document_format]

    Report.new(document_format: format).generate
  end
end
