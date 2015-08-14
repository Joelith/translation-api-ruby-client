# Swagger common files
require 'TranslationApi_client/monkey'
require 'TranslationApi_client/swagger'
require 'TranslationApi_client/swagger/configuration'
require 'TranslationApi_client/swagger/request'
require 'TranslationApi_client/swagger/response'
require 'TranslationApi_client/swagger/version'

# Models
require 'TranslationApi_client/models/base_object'
require 'TranslationApi_client/models/translation_output'
require 'TranslationApi_client/models/translation_response'
require 'TranslationApi_client/models/translation_status'
require 'TranslationApi_client/models/translation_cancel'
require 'TranslationApi_client/models/profile_id'
require 'TranslationApi_client/models/language_pair'
require 'TranslationApi_client/models/supported_language_response'
require 'TranslationApi_client/models/profile'
require 'TranslationApi_client/models/profiles_response'

# APIs
require 'TranslationApi_client/api/translation_api'

module TranslationApiClient
  # Initialize the default configuration
  Swagger.configuration ||= Swagger::Configuration.new
end
