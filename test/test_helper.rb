require 'test/unit'
require 'active_support/test_case'
require 'mocha'

$:.unshift File.expand_path("lib")
require 'active_record_3_api'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:'
)