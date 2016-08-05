require 'easy_rps/version'
require 'easy_rps/rps'
require 'easy_rps/errors'
require 'easy_rps/models'
require 'easy_rps/orm/active_record'
%w(base_printer register header item footer rps_field).each do |printer_file|
  require "easy_rps/printers/#{printer_file}"
end

# Testing main modules
%w(issuer rps_item taker).each do |module_name|
  require "easy_rps/modules/#{module_name}"
end


$LOAD_PATH.unshift File.expand_path('easy_rps/modules', __FILE__)

module EasyRps
  # autoload :Templates,    'easy_rps/templates'
  # autoload :Printers,     'easy_rps/printers'
end
