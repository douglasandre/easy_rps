ENV["RAILS_ENV"] = "test"

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'easy_rps'
require 'rails_app/config/environment'
require "support/helpers"