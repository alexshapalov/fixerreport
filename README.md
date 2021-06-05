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

Or you can use Docker

## Genarate report

When you run the rake task, please chose the format: csv, xls, html, json

### Example: 

` rake generate_report DOCUMENT_FORMAT=csv`

## License

The app is available as open-source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Copyright

Copyright © 2021 FixerData

