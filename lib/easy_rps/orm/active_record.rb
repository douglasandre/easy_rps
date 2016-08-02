require 'active_support'
require 'active_support/core_ext'

ActiveSupport.on_load(:active_record) do
  extend EasyRps::Models
end