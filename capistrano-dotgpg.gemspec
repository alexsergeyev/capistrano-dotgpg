# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/dotgpg/version'

Gem::Specification.new do |gem|
  gem.name          = "capistrano-dotgpg"
  gem.version       = Capistrano::Dotgpg::VERSION
  gem.authors       = ["Alex Sergeyev"]
  gem.email         = ["alex.sergeyev@gmail.com"]
  gem.summary       = %q{Manage dotgpg files}
  gem.description   = %q{Decrypt and upload dotgpg files}
  gem.homepage      = "https://github.com/alexsergeyev/capistrano-dotgpg"
  gem.license       = "MIT"

  gem.files         = `git ls-files -z`.split("\x0")
  gem.require_paths = ["lib"]

  gem.add_dependency 'capistrano', '~> 3.1'
  gem.add_dependency 'sshkit', '~> 1.2'
end
