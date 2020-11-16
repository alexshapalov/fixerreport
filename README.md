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

## Chose formats for generation:

In Rakefile, please choose a format: csv, xls, html, json

example: 

` document_format = csv`

## Genarate report:

`$ rake generate_report`


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


## Copyright

Copyright © 2020 Recipe FixerData