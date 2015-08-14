require 'rspec'
require 'webrick'

require_relative '../lib/translationApiClient'

describe "TranslationApiClient" do
  before :all do
    TranslationApiClient::Swagger.configure do |configuration|
      configuration.key = "<API KEY HERE>"
    end

  end
  describe "Configuration" do
    it "assures the user has a correct client configuration" do
      expect(TranslationApiClient::Swagger.configuration.key.length).to eq(36)
    end
  end

  describe "TranslationApi" do
    it "Lists language pairs in which translation is supported." do
      result = TranslationApiClient::TranslationApi.translation_supported_languages_get
      expect(result.language_pairs).not_to be_empty
    end
    it "Lists profiles available for translation." do
      result = TranslationApiClient::TranslationApi.translation_profile_get
      expect(result.profiles).not_to be_empty
    end
    it "Translates text from source language to target language" do
      result = TranslationApiClient::TranslationApi.translation_translate_get("The quick brown fox jumps over the lazy dog", "fr")
      expect(result.outputs).not_to be_empty
    end
    it "Translates text from source language to target language with annotations and source" do
      result = TranslationApiClient::TranslationApi.translation_translate_get("The quick brown fox jumps over the lazy dog", "fr", {:with_source => true, :with_annotations => true})
      expect(result.outputs).not_to be_empty
    end
    it "Synchronously translates a file from source language to target language" do
      result = TranslationApiClient::TranslationApi.translation_translate_file_get(File.open("./spec/sample.txt","r"), "fr")
      expect(result.outputs).not_to be_empty
    end
    it "Asynchronously translates a file from source language to target language" do
      result = TranslationApiClient::TranslationApi.translation_translate_file_get(File.open("./spec/sample.txt","r"), "fr",  {:async =>  true})
      expect(result.requestId).to be_truthy
    end
    it "Gets the status of an asynchronous translation request" do
      request = TranslationApiClient::TranslationApi.translation_translate_file_get(File.open("./spec/sample.txt","r"), "fr",  {:async =>  true})
      result = TranslationApiClient::TranslationApi.translation_translate_status_get(request.requestId)
      expect(result).to be_truthy
    end
    it "Cancels an asynchronous translation request" do
      request = TranslationApiClient::TranslationApi.translation_translate_file_get(File.open("./spec/sample.txt","r"), "fr",  {:async =>  true})
      result = TranslationApiClient::TranslationApi.translation_translate_cancel_get(request.requestId)
       expect(result).to be_truthy
    end
  end
end

