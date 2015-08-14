module TranslationApiClient
  # 
  class TranslationStatus < BaseObject
    attr_accessor :error, :cancelled, :created_at, :description, :expire_at, :finished_at, :finished_steps, :status, :total_steps
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # Error of the request
        :'error' => :'error',
        
        # Is the request cancelled
        :'cancelled' => :'cancelled',
        
        # Creation time of the request (ms since the Epoch)
        :'created_at' => :'createdAt',
        
        # Description
        :'description' => :'description',
        
        # Expiration time of the request (ms since the Epoch)
        :'expire_at' => :'expireAt',
        
        # Completion time of the request (ms since the Epoch)
        :'finished_at' => :'finishedAt',
        
        # Number of finished steps
        :'finished_steps' => :'finishedSteps',
        
        # Status of the request
        :'status' => :'status',
        
        # Number of steps to complete
        :'total_steps' => :'totalSteps'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'error' => :'string',
        :'cancelled' => :'boolean',
        :'created_at' => :'number',
        :'description' => :'string',
        :'expire_at' => :'number',
        :'finished_at' => :'number',
        :'finished_steps' => :'int',
        :'status' => :'string',
        :'total_steps' => :'int'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'error']
        @error = attributes[:'error']
      end
      
      if attributes[:'cancelled']
        @cancelled = attributes[:'cancelled']
      end
      
      if attributes[:'createdAt']
        @created_at = attributes[:'createdAt']
      end
      
      if attributes[:'description']
        @description = attributes[:'description']
      end
      
      if attributes[:'expireAt']
        @expire_at = attributes[:'expireAt']
      end
      
      if attributes[:'finishedAt']
        @finished_at = attributes[:'finishedAt']
      end
      
      if attributes[:'finishedSteps']
        @finished_steps = attributes[:'finishedSteps']
      end
      
      if attributes[:'status']
        @status = attributes[:'status']
      end
      
      if attributes[:'totalSteps']
        @total_steps = attributes[:'totalSteps']
      end
      
    end
  end
end
