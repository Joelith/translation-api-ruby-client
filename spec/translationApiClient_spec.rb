require 'rspec'
require 'httpadapter'

require_relative '../lib/translationApiClient'

describe "TranslationApiClient" do
  before :all do
    TranslationApiClient::Swagger.configure do |configuration|
      configuration.host = "﻿https://platform.systran.net:8904"
      if File.exists?("./key.txt")
        key = File.read("./key.txt", :encoding => 'UTF-8')
        if key.length > 0
          configuration.key = key
        else
          puts "The key.txt file is empty"
        end
      else
        puts"The key.txt file doesn't exists"
      end

    end

  end
  describe "Configuration" do
    it "assures the user has a correct client configuration" do
      expect(TranslationApiClient::Swagger.configuration.key.length).to be_between(10, 100)
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
      result = TranslationApiClient::TranslationApi.translation_translate_file_get(File.open("./spec/sample.txt","r"), "fr", {:with_source => true, :with_annotations => true})
      expect(result).not_to be_empty
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

