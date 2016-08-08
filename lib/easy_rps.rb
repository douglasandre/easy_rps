# Main files
%w(version app/models/rps errors models orm/active_record).each do |main_file|
  require "easy_rps/#{main_file}"
end

# Printers
%w(base_printer register header detail footer rps_field).each do |printer_file|
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
