# Capistrano::Dotgpg

Upload secrets and shared password managed by [dotgpg]('https://github.com/ConradIrwin/dotgpg')

  - `cap dotgpg:env`

## Configuration options

```ruby
set :dotgpg_files,      '.env.gpg'        # Encrypted .env files
set :capistrano_export, 'shared_path'     # Capistrano specific options to export
```

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-dotgpg'
    gem 'capistrano-dotgpg',  github: 'alexsergeyev/capistrano-eye'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-dotgpg

## Contributing

1. Fork it ( https://github.com/alexsergeyev/capistrano-dotgpg/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
