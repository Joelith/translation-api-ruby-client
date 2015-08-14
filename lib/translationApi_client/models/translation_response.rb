module TranslationApiClient
  # 
  class TranslationResponse < BaseObject
    attr_accessor :warning, :error, :request_id, :outputs
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # Warning at request level
        :'warning' => :'warning',
        
        # Error at request level
        :'error' => :'error',
        
        # Request identifier to use to get the status, the result of the request and to cancel it in asynchronous mode
        :'request_id' => :'requestId',
        
        # Outputs of translation
        :'outputs' => :'outputs'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'warning' => :'string',
        :'error' => :'string',
        :'request_id' => :'string',
        :'outputs' => :'array[TranslationOutput]'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'warning']
        @warning = attributes[:'warning']
      end
      
      if attributes[:'error']
        @error = attributes[:'error']
      end
      
      if attributes[:'requestId']
        @request_id = attributes[:'requestId']
      end
      
      if attributes[:'outputs']
        if (value = attributes[:'outputs']).is_a?(Array)
          @outputs = value
        end
      end
      
    end
  end
end
