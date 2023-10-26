# Xdrgen for Elixir Stellar Base


## Installation

Install the gem that generates the XDR files:

    $ gem install xdrgen

## Usage

1. Place your Stellar XDR files in the `stellar-files/` folder.
2. Delete the `generated/` folder with `rm -rf generated/`.
3. Start the generation with `ruby run.rb`
4. See the changes in the `generated/` folder.
5. Based on the changes, update the [**`stellar_base`**](https://github.com/kommitters/stellar_base) library.


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/xdrgen-test.
