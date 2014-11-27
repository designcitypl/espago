# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
require 'simplecov'
SimpleCov.start

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'webmock/rspec'
require 'vcr'
require './lib/espago'

VCR.configure do |c|
  c.default_cassette_options = {:record => :once, :serialize_with => :yaml}
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
end
#WebMock.allow_net_connect!
#VCR.turn_off!(:ignore_cassettes => false)
#VCR.turn_on!

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus


  config.before(:each) do
    Espago.app_id = 'app_id_test'
    Espago.app_password = 'app_password_test'
    Espago.public_key = 'app_public_key_test'
    Espago.production = false
    Espago.api_version = '2'
  end


  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
