module EasyRps
  module Models

    VALID_MODULES = [:issuer, :rps_item, :taker]

    def easy_rps(*modules)
      modules.dup.each do |m|
        if VALID_MODULES.include?(m)
          binding.pry
          extend EasyRps::Modules.const_get(m.to_s.classify)
        else
          raise EasyRps::Errors::InvalidRPSModuleError
        end
      end
    end
  end
end