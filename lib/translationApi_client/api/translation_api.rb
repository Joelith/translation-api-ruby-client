require "uri"
require 'ostruct'
require 'json'

module                                                                                                                                                                 TranslationApiClient
  class TranslationApi
    basePath = "https://platform.systran.net:8904/"
    # apiInvoker = APIInvoker

    # List of profiles
    # List of profiles available for translation.\n
    # @param [Hash] opts the optional parameters
    # @option opts [string] :source Source language code of the profile
    # @option opts [string] :target Target Language code of the profile\n
    # @option opts [array[int]] :id Identifier of the profile\n
    # @option opts [string] :callback Javascript callback function name for JSONP Support\n
    # @return [ProfilesResponse]
    def self.translation_profile_get(opts = {})
      

      # resource path
      path = "/translation/profile".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'source'] = opts[:'source'] if opts[:'source']
      query_params[:'target'] = opts[:'target'] if opts[:'target']
      query_params[:'id'] = opts[:'id'] if opts[:'id']
      query_params[:'callback'] = opts[:'callback'] if opts[:'callback']

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      

      auth_names = ['accessToken', 'apiKey']
      response = Swagger::Request.new(:GET, path, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :auth_names => auth_names}).make.body
      obj = ProfilesResponse.new() and obj.build_from_hash(response)
    end

    # Supported Languages
    # List of language pairs in which translation is supported.\n\nThis list can be limited to a specific source language or target language.\n
    # @param [Hash] opts the optional parameters
    # @option opts [array[string]] :source Language code of the source text\n
    # @option opts [array[string]] :target Language code into which to translate the source text\n
    # @option opts [string] :callback Javascript callback function name for JSONP Support\n
    # @return [SupportedLanguageResponse]
    def self.translation_supported_languages_get(opts = {})
      

      # resource path
      path = "/translation/supportedLanguages".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'source'] = opts[:'source'] if opts[:'source']
      query_params[:'target'] = opts[:'target'] if opts[:'target']
      query_params[:'callback'] = opts[:'callback'] if opts[:'callback']

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      

      auth_names = ['accessToken', 'apiKey']
      response = Swagger::Request.new(:GET, path, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :auth_names => auth_names}).make.body
      obj = SupportedLanguageResponse.new() and obj.build_from_hash(response)
    end

    # Translate
    # Translate text from source language to target language\n
    # @param input Input text (this parameter can be repeated)\n
    # @param target Target language code ([details](#description_langage_code_values))
    # @param [Hash] opts the optional parameters
    # @option opts [string] :source Source language code ([details](#description_langage_code_values)) or `auto`.\n\nWhen the value is set to `auto`, the language will be automatically detected, used to enhance the translation, and returned in output.\n
    # @option opts [string] :format Format of the source text.\n\nValid values are `text` for plain text, `html` for HTML pages, and `auto` for automatic detection. The MIME type of file format supported by SYSTRAN can also be used (application/vnd.openxmlformats, application/vnd.oasis.opendocument, ...)\n
    # @option opts [int] :profile Profile id\n
    # @option opts [boolean] :with_source If `true`, the source will also be sent back in the response message. It can be useful when used with the withAnnotations option to align the source document with the translated document\n
    # @option opts [boolean] :with_annotations If `true`, different annotations will be provided in the translated document. If the option &#39;withSource&#39; is used, the annotations will also be provided in the source document. It will provide segments, tokens, not found words,...\n
    # @option opts [string] :with_dictionary User Dictionary or/and Normalization Dictionary ids to be applied to the translation result. Each dictionary &#39;id&#39; has to be separate by a comma.\n
    # @option opts [boolean] :back_translation If `true`, the translated text will be translated back in source language\n
    # @option opts [array[string]] :options Additional options.\n\nAn option can be a JSON object containing a set of key/value generic options supported by the translator. It can also be a string with the syntax &#39;&lt;key&gt;:&lt;value&gt;&#39; to pass a key/value generic option to the translator.\n
    # @option opts [string] :encoding Encoding. `base64` can be useful to send binary documents in the JSON body. Please note that another alternative is to use translateFile\n
    # @option opts [boolean] :async If `true`, the translation is performed asynchronously.\n\nThe \&quot;/translate/status\&quot; service must be used to wait for the completion of the request and the \&quot;translate/result\&quot; service must be used to get the final result. The \&quot;/translate/cancel\&quot; can be used to cancel the request.\n
    # @option opts [string] :callback Javascript callback function name for JSONP Support\n
    # @return [TranslationResponse]
    def self.translation_translate_get(input, target, opts = {})
      
      # verify the required parameter 'input' is set
      raise "Missing the required parameter 'input' when calling translation_translate_get" if input.nil?
      
      # verify the required parameter 'target' is set
      raise "Missing the required parameter 'target' when calling translation_translate_get" if target.nil?
      

      # resource path
      path = "/translation/text/translate".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'input'] = input
      query_params[:'target'] = target
      query_params[:'source'] = opts[:'source'] if opts[:'source']
      query_params[:'format'] = opts[:'format'] if opts[:'format']
      query_params[:'profile'] = opts[:'profile'] if opts[:'profile']
      query_params[:'withSource'] = opts[:'with_source'] if opts[:'with_source']
      query_params[:'withAnnotations'] = opts[:'with_annotations'] if opts[:'with_annotations']
      query_params[:'withDictionary'] = opts[:'with_dictionary'] if opts[:'with_dictionary']
      query_params[:'backTranslation'] = opts[:'back_translation'] if opts[:'back_translation']
      query_params[:'options'] = opts[:'options'] if opts[:'options']
      query_params[:'encoding'] = opts[:'encoding'] if opts[:'encoding']
      #query_params[:'async'] = opts[:'async'] if opts[:'async']
      query_params[:'callback'] = opts[:'callback'] if opts[:'callback']

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      

      auth_names = ['accessToken', 'apiKey']
      response = Swagger::Request.new(:POST, path, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :auth_names => auth_names}).make.body
      obj = TranslationResponse.new() and obj.build_from_hash(response)
    end

    # Translate Cancel
    # Cancel an asynchronous translation request\n
    # @param request_id Request Identifier\n
    # @param [Hash] opts the optional parameters
    # @option opts [string] :callback Javascript callback function name for JSONP Support\n
    # @return [TranslationCancel]
    def self.translation_translate_cancel_get(request_id, opts = {})
      
      # verify the required parameter 'request_id' is set
      raise "Missing the required parameter 'request_id' when calling translation_translate_cancel_get" if request_id.nil?
      

      # resource path
      path = "/translation/file/cancel".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'requestId'] = request_id
      query_params[:'callback'] = opts[:'callback'] if opts[:'callback']

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      

      auth_names = ['accessToken', 'apiKey']
      response = Swagger::Request.new(:POST, path, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :auth_names => auth_names}).make.body
      obj = TranslationCancel.new() and obj.build_from_hash(response)
    end

    # Translate file
    # Translate a file from source language to target language\n\n\n* In asynchronous mode (async=true), the response will be a JSON containing a request identifier. This identifier can then be used to poll the request status and its result when completed.\n\n  ```\n  {\n     \&quot;requestId\&quot;: \&quot;54a3d860e62ea467b136eddb\&quot; /* Request identifier to use to get the status,\n                                                the result of the request and to cancel it */\n     \&quot;error\&quot;: \&quot;\&quot;, /* Error at request level */\n  }\n  ```\n\n* In synchronous mode, the response will be either:\n\n  * The **translated document**, directly, if `source` parameters was not `auto` and `withSource` was not true\n  * A `multipart/mixed` document with the following parts:\n\n    1. **Detected language**, if request was done with `auto` source language\n\n      * Header:\n\n        `part-name: detectedLanguage`\n\n      * Body: JSON document\n        ```\n        {\n          detectedLanguage: \&quot;string\&quot;\n          detectedLanguageConfidence : number\n        }\n        ```\n\n    2. **Source document**, if request was done with `withSource`:\n\n      * Header: `part-name: source`\n      * Body: Source document\n\n    3. **Translated document**\n\n      * Header: `part-name: output`\n\n      * Body: Translated document\n
    # @param input Input file\n
    # @param target Target language code ([details](#description_langage_code_values))
    # @param [Hash] opts the optional parameters
    # @option opts [string] :source Source language code ([details](#description_langage_code_values)) or `auto`.\n\nWhen the value is set to `auto`, the language will be automatically detected, used to enhance the translation, and returned in output.\n
    # @option opts [string] :format Format of the source text.\n\nValid values are `text` for plain text, `html` for HTML pages, and `auto` for automatic detection. The MIME type of file format supported by SYSTRAN can also be used (application/vnd.openxmlformats, application/vnd.oasis.opendocument, ...)\n
    # @option opts [int] :profile Profile id\n
    # @option opts [boolean] :with_source If `true`, the source will also be sent back in the response message. It can be useful when used with the withAnnotations option to align the source document with the translated document\n
    # @option opts [boolean] :with_annotations If `true`, different annotations will be provided in the translated document. If the option &#39;withSource&#39; is used, the annotations will also be provided in the source document. It will provide segments, tokens, not found words,...\n
    # @option opts [string] :with_dictionary User Dictionary or/and Normalization Dictionary ids to be applied to the translation result. Each dictionary &#39;id&#39; has to be separate by a comma.\n
    # @option opts [array[string]] :options Additional options.\n\nAn option can be a JSON object containing a set of key/value generic options supported by the translator. It can also be a string with the syntax &#39;&lt;key&gt;:&lt;value&gt;&#39; to pass a key/value generic option to the translator.\n
    # @option opts [string] :encoding Encoding. `base64` can be useful to send binary documents in the JSON body. Please note that another alternative is to use translateFile\n
    # @option opts [boolean] :async If `true`, the translation is performed asynchronously.\n\nThe \&quot;/translate/status\&quot; service must be used to wait for the completion of the request and the \&quot;translate/result\&quot; service must be used to get the final result. The \&quot;/translate/cancel\&quot; can be used to cancel the request.\n
    # @option opts [string] :callback Javascript callback function name for JSONP Support\n
    # @return [file]
    def self.translation_translate_file_get(input, target, opts = {})
      
      # verify the required parameter 'input' is set
      raise "Missing the required parameter 'input' when calling translation_translate_file_get" if input.nil?
      
      # verify the required parameter 'target' is set
      raise "Missing the required parameter 'target' when calling translation_translate_file_get" if target.nil?
      

      # resource path
      path = "/translation/file/translate".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'target'] = target
      query_params[:'source'] = opts[:'source'] if opts[:'source']
      query_params[:'format'] = opts[:'format'] if opts[:'format']
      query_params[:'profile'] = opts[:'profile'] if opts[:'profile']
      query_params[:'withSource'] = opts[:'with_source'] if opts[:'with_source']
      query_params[:'withAnnotations'] = opts[:'with_annotations'] if opts[:'with_annotations']
      query_params[:'withDictionary'] = opts[:'with_dictionary'] if opts[:'with_dictionary']
      query_params[:'options'] = opts[:'options'] if opts[:'options']
      query_params[:'encoding'] = opts[:'encoding'] if opts[:'encoding']
      query_params[:'async'] = opts[:'async'] if opts[:'async']
      query_params[:'callback'] = opts[:'callback'] if opts[:'callback']

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json', 'multipart/mixed', '*/*']
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = ['multipart/form-data', 'application/x-www-form-urlencoded', '*/*']
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}
      form_params["input"] = input

      # http body (model)
      post_body = nil
      

      auth_names = ['accessToken', 'apiKey']
      response = Swagger::Request.new(:POST, path, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :auth_names => auth_names}).make.body
      if query_params[:'async']
      OpenStruct.new(response)
      else
        response
      end
    end

    # Translate Result
    # Get the result of an asynchronous translation request\n\nDepending on the initial request, the response can have multiple formats:\n* `/translation/translate` initiated request\n\n    &amp;#x2192; the response will be a JSON document (model below)\n\n* `/translation/translate/file` initiated request\n\n   &amp;#x2192; the response will be either:\n\n  * The **translated document**, directly, if `source` parameters was not `auto` and `withSource` was not true\n  * A `multipart/mixed` document with the following parts:\n\n    1. **Detected language**, if request was done with `auto` source language\n\n      * Header:\n\n        `part-name: detectedLanguage`\n\n      * Body: JSON document\n        ```\n        {\n          detectedLanguage: \&quot;string\&quot;\n          detectedLanguageConfidence : number\n        }\n        ```\n\n    2. **Source document**, if request was done with `withSource`:\n\n      * Header: `part-name: source`\n      * Body: Source document\n\n    3. **Translated document**\n\n      * Header: `part-name: output`\n\n      * Body: Translated document\n\nAn error can occur in the following cases:\n* Invalid request ID\n* No result available (see request status for more information)\n* Unable to retrieve the result\n* ...\n
    # @param request_id Request Identifier\n
    # @param [Hash] opts the optional parameters
    # @option opts [string] :callback Javascript callback function name for JSONP Support\n
    # @return [TranslationResponse]
    def self.translation_translate_result_get(request_id, opts = {})
      
      # verify the required parameter 'request_id' is set
      raise "Missing the required parameter 'request_id' when calling translation_translate_result_get" if request_id.nil?
      

      # resource path
      path = "/translation/file/result".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'requestId'] = request_id
      query_params[:'callback'] = opts[:'callback'] if opts[:'callback']

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json', 'multipart/mixed', '*/*']
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      

      auth_names = ['accessToken', 'apiKey']
      response = Swagger::Request.new(:GET, path, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :auth_names => auth_names}).make.body
      obj = TranslationResponse.new() and obj.build_from_hash(response)
    end

    # Translate Status
    # Get the status of an asynchronous translation request\n\nThe translation result is available when the value of the status field is `finished`.\n\nThe translation request is unsuccessful when the value of the status field is `error`.\n
    # @param request_id Request Identifier\n
    # @param [Hash] opts the optional parameters
    # @option opts [string] :callback Javascript callback function name for JSONP Support\n
    # @return [TranslationStatus]
    def self.translation_translate_status_get(request_id, opts = {})
      
      # verify the required parameter 'request_id' is set
      raise "Missing the required parameter 'request_id' when calling translation_translate_status_get" if request_id.nil?
      

      # resource path
      path = "/translation/file/status".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'requestId'] = request_id
      query_params[:'callback'] = opts[:'callback'] if opts[:'callback']

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = Swagger::Request.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = []
      header_params['Content-Type'] = Swagger::Request.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      

      auth_names = ['accessToken', 'apiKey']
      response = Swagger::Request.new(:GET, path, {:params => query_params, :headers => header_params, :form_params => form_params, :body => post_body, :auth_names => auth_names}).make.body
      obj = TranslationStatus.new() and obj.build_from_hash(response)
    end
  end
end
