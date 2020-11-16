#!/usr/bin/env rake

require 'net/http'
require 'csv'
require 'json'
require_relative 'lib/report'
require_relative 'lib/csv_reporter'
require_relative 'lib/json_reporter'
require_relative 'lib/html_reporter'
require_relative 'lib/xls_reporter'

desc "generate a report on currency developmen"
task :generate_report do
  csv = CsvReport.new
  json = JsonReport.new
  html = HtmlReport.new
  xls = XlsReport.new

  # Chose formats: csv, xls, html, json
  # example: 
  # document_format = csv
  document_format = json
  
  Report.new(document_format).generate
end
