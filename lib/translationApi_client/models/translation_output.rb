module TranslationApiClient
  # 
  class TranslationOutput < BaseObject
    attr_accessor :warning, :error, :detected_language, :detected_language_confidence, :output, :back_translation, :source
    # attribute mapping from ruby-style variable name to JSON key
    def self.attribute_map
      {
        
        # Warning at output level
        :'warning' => :'warning',
        
        # Error at output level
        :'error' => :'error',
        
        # Result of the automatic language detection if `auto` was specified as source language
        :'detected_language' => :'detectedLanguage',
        
        # Automatic language detection confidence
        :'detected_language_confidence' => :'detectedLanguageConfidence',
        
        # Translated text
        :'output' => :'output',
        
        # Retranslation of output in source language, if backTranslation was specified
        :'back_translation' => :'backTranslation',
        
        # Source text, if withSource was specified
        :'source' => :'source'
        
      }
    end

    # attribute type
    def self.swagger_types
      {
        :'warning' => :'string',
        :'error' => :'string',
        :'detected_language' => :'string',
        :'detected_language_confidence' => :'double',
        :'output' => :'string',
        :'back_translation' => :'string',
        :'source' => :'string'
        
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
      
      if attributes[:'detectedLanguage']
        @detected_language = attributes[:'detectedLanguage']
      end
      
      if attributes[:'detectedLanguageConfidence']
        @detected_language_confidence = attributes[:'detectedLanguageConfidence']
      end
      
      if attributes[:'output']
        @output = attributes[:'output']
      end
      
      if attributes[:'backTranslation']
        @back_translation = attributes[:'backTranslation']
      end
      
      if attributes[:'source']
        @source = attributes[:'source']
      end
      
    end
  end
end
