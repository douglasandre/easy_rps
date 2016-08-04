module EasyRps
  module Models

    VALID_MODULES = [:issuer, :rps_item, :taker]

    def easy_rps(*modules)
      modules.dup.each do |m|
        if VALID_MODULES.include?(m)
          # setup_required_responses(EasyRps::Modules.const_get(m.to_s.classify))
          include EasyRps::Modules.const_get(m.to_s.classify)
        else
          raise EasyRps::Errors::InvalidRPSModuleError
        end
      end
    end


    private

    def setup_required_responses(mod)
      mod.required_responses.each do |resp|
        unless defined?(@resp)
          mod.class_eval <<-METHOD, __FILE__, __LINE__ + 1
            def #{resp}
              if defined?(@#{resp})
                @#{resp}
              else
                "You need to implement the '#{resp}' method on your #{self.name} class, or configure an alias to use the EasyRps"
              end
            end
            def #{resp}=(value)
              @#{resp} = value
            end
          METHOD
        end
      end
    end
  end
end