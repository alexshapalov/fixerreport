# FixerReport app 

The Fixer Report app generates a report on currency development.

## Development Requirements

  * Ruby 2.7.0+
  * Bundler

## Installation

```
rvm install 2.7.0
rvm use 2.7.0
bundle install
```

Or you can use Docker.

## Genarate report:

When you run the rake task, please chose the format: csv, xls, html, json

example: 

` rake generate_report DOCUMENT_FORMAT=csv`

## Generate report:

`$ rake generate_report`

## License

The app is available as open-source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Copyright

Copyright © 2020 FixerData











# Chose formats: csv, xls, html, json
# example: 
# rake generate_report DOCUMENT_FORMAT=csv
desc "generate a report on currency development"
task :generate_report do
  document_format = ENV['DOCUMENT_FORMAT'].to_sym
 
  formats = {
    csv: CsvReport.new
    # html: HtmlReport.new,
    # xlx: XlsReport.new,
    # json: JsonReport.new
  }

  p document_format = formats[document_format]

  Report.new(document_format).generate
end
