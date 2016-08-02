require 'easy_rps/version'
require 'easy_rps/errors'
require 'easy_rps/models'
require 'easy_rps/orm/active_record'

$LOAD_PATH.unshift File.expand_path('easy_rps/modules', __FILE__)

module EasyRps
  autoload :Templates,    'easy_rps/templates'
  autoload :Printers,     'easy_rps/printers'
  %w(issuer rps_item taker).each do |module_name|
    camelized = ActiveSupport::Inflector.camelize(module_name.to_s)
    autoload camelized.to_sym, "easy_rps/modules/#{module_name}"
  end    
end

