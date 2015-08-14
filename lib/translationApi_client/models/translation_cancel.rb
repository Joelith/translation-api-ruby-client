module TranslationApiClient
  # 
  class TranslationCancel < BaseObject
    attr_accessor :error
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # Error of the request
        :'error' => :'error'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'error' => :'string'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'error']
        @error = attributes[:'error']
      end
      
    end
  end
end
