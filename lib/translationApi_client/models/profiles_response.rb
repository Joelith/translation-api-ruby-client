module TranslationApiClient
  # 
  class ProfilesResponse < BaseObject
    attr_accessor :profiles
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # Array of profiles
        :'profiles' => :'profiles'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'profiles' => :'array[Profile]'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'profiles']
        if (value = attributes[:'profiles']).is_a?(Array)
          @profiles = value
        end
      end
      
    end
  end
end
