# require File.expand_path('../lib', __FILE__)

require 'rspec'
require 'rack/test'
require 'pry-byebug'

require 'net/http'
require 'csv'
require 'json'
require_relative '../lib/report'
require_relative '../lib/csv_reporter'
require_relative '../lib/json_reporter'
require_relative '../lib/html_reporter'
require_relative '../lib/xls_reporter'

def app
  described_class
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  # config.include Lib

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end
