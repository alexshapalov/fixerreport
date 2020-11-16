#!/usr/bin/env rake

require 'net/http'
require 'csv'
require 'json'
require 'date'
require_relative 'lib/report'

desc "generate a report on currency developmen"
task :generate_report do
  day = Date.today
  document_format = "csv"
  Report.new(day, document_format).generate
end
