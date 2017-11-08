# Swagger common files
require 'translationApi_client/monkey'
require 'translationApi_client/swagger'
require 'translationApi_client/swagger/configuration'
require 'translationApi_client/swagger/request'
require 'translationApi_client/swagger/response'
require 'translationApi_client/swagger/version'

# Models
require 'translationApi_client/models/base_object'
require 'translationApi_client/models/translation_output'
require 'translationApi_client/models/translation_response'
require 'translationApi_client/models/translation_status'
require 'translationApi_client/models/translation_cancel'
require 'translationApi_client/models/profile_id'
require 'translationApi_client/models/language_pair'
require 'translationApi_client/models/supported_language_response'
require 'translationApi_client/models/profile'
require 'translationApi_client/models/profiles_response'
require 'httpadapter'

# APIs
require 'translationApi_client/api/translation_api'

module TranslationApiClient
  # Initialize the default configuration
  Swagger.configuration ||= Swagger::Configuration.new
end
