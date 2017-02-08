# letsencrypt_rack

A rack middleware to serve the letsencrypt challenge request answer, provided in an environment variable. Best used with https://github.com/xijo/letsencrypt_heroku.

## Installation

Add this line to your application's Gemfile.

```ruby
gem 'letsencrypt_rack'
```

And then execute:

    $ bundle

You can check that the middleware is used correctly with:

    $ rake middleware

## Usage

Provide `LETSENCRYPT_RESPONSE` as environment variable within your server. For heroku you can use the toolbelt to set it:

    $ heroku config:set LETSENCRYPT_RESPONSE=foo.bar

The middleware will answer all matching challenge requests:

    $ curl http://your.host/.well-known/acme-challenge/foo
    foo.bar

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/letsencrypt_rack.

## License

http://www.wtfpl.net/
