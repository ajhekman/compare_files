# CompareFiles

A simple utility to compare file membership in two places.
A "place" may either be a directory, or a text file containing a file per line.

A common use case is to save the output of the `right` item, and use it at a future date as the `left` item. This will list new items since the first comparison was run.

## Installation

To install as a stand-alone executable, install with [specific_install](https://github.com/rdp/specific_install)

1. install specific_install `gem install specific_install`
1. choose to install lastest master, or a specific relase
    * *latest master*: `gem specific_install --user-install ajhekman/compare_files`
    * *specific release*: `gem specific_install --user-install --ref <ref> ajhekman/compare_files`


**OR** install as a library within your application by addding this line to your application's Gemfile:

```ruby
gem 'compare_files', github: 'ajhekman/compare_files
```

And then execute:

    $ bundle

## Usage

```
Usage: compare_files [options]
        --left=LEFT      'old' side to compare against. May be a folder, or text file.
        --right=RIGHT    'current' side to compare against. May be a folder, or text file.
    -h, --help           Prints this help
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ajhekman/compare_files.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
