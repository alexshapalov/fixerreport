#!/usr/bin/env rake
require 'net/http'
require 'csv'
require 'json'
require 'date'
require_relative 'lib/report'

desc "generate a report on currency developmen"
task :generate_report do
  day = Date.today
  format = "csv"
  Report.generate(day, format)
end
