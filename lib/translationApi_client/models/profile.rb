module TranslationApiClient
  # 
  class Profile < BaseObject
    attr_accessor :id, :localization, :name, :source, :target
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # Profile identifier
        :'id' => :'id',
        
        # Localization of the profile name
        :'localization' => :'localization',
        
        # Name
        :'name' => :'name',
        
        # Source
        :'source' => :'source',
        
        # Target
        :'target' => :'target'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'id' => :'int',
        :'localization' => :'object',
        :'name' => :'string',
        :'source' => :'string',
        :'target' => :'string'
        
      }
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.empty?

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'id']
        @id = attributes[:'id']
      end
      
      if attributes[:'localization']
        @localization = attributes[:'localization']
      end
      
      if attributes[:'name']
        @name = attributes[:'name']
      end
      
      if attributes[:'source']
        @source = attributes[:'source']
      end
      
      if attributes[:'target']
        @target = attributes[:'target']
      end
      
    end
  end
end
