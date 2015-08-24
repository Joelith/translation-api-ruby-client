require 'httpadapter/adapters/typhoeus'
require 'rack/request'
require 'rack/multipart'

module TranslationApiClient
  module Swagger
    class Response
      require 'json'


      attr_accessor :raw

      def initialize(raw)
        self.raw = raw

        case self.code
        when 500..510 then raise(ServerError, self.error_message)
        when 299..426 then raise(ClientError, self.error_message)
        end
      end

      def code
        raw.code
      end

      # Account for error messages that take different forms...
      def error_message
        body['message']
      rescue
        body
      end

      # If body is JSON, parse it
      # Otherwise return raw string
      def body
        if headers["Content-Type"] && (headers["Content-Type"].include?  "multipart/")
          adapter = HTTPAdapter::TyphoeusAdapter.new

          result = adapter.adapt_response(raw)
          req = Rack::Request.new(result)
          parts = req.env[2][0].force_encoding("UTF-8").split("--"+headers["Content-Type"][27...67])
          parts.delete_if {|x| !x.include? "part-name: "}
          parts.map! { |value|
            arr = value.split(' ')
            arr[0] = ''
            arr[1] = '"'+arr[1]+'":'
            if arr[2][0] != '{'
              for i in 2..arr.length-1
                arr[i] = arr[i].gsub('"', '\"')
              end
              arr[2] = '{ "ouput":"'+arr[2]
            end
            if arr[-1][-1] != '}'
              arr[-1] = arr[-1]+'"}'
            end
            arr[-1] = arr[-1]+','
            arr = arr.join(" ")
            value = arr
          }
          parts = parts.join(" ").sub! /\,$/, ''

          parts = "{"+parts+'}'
          #JSON.parse(parts)
          #JSON.parse req.env[2].gsub('=>', ':')
          puts parts#JSON.parse(parts)
        #  Rack::Multipart.parse_multipart(req.env)
      result

        else
          begin
          JSON.parse(raw.body, :symbolize_names => true)
          rescue
            raw.body
          end
        end

      end

      # `headers_hash` is a Typhoeus-specific extension of Hash,
      # so simplify it back into a regular old Hash.
      def headers
        h = {}
        raw.headers_hash.each {|k,v| h[k] = v }
        h
      end

      # Extract the response format from the header hash
      # e.g. {'Content-Type' => 'application/json'}
      def format
        headers['Content-Type'].split("/").last.downcase
      end

      def json?
        format == 'json'
      end

      def xml?
        format == 'xml'
      end

      def pretty_body
        return unless body.present?
        case format
        when 'json' then JSON.pretty_generate(body).gsub(/\n/, '<br/>')
        end
      end

      def pretty_headers
        JSON.pretty_generate(headers).gsub(/\n/, '<br/>')
      end
    end
  end
end
