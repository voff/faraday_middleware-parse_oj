require 'faraday_middleware/response_middleware'

module FaradayMiddleware
  class ParseOj < ResponseMiddleware
    dependency 'oj'
    
    define_parser do |body|
      Oj.load(body, mode: :compat) unless body.strip.empty?
    end
    
    VERSION = '0.2.1'
  end
end
if Faraday.respond_to? :register_middleware
    Faraday.register_middleware :response, oj: FaradayMiddleware::ParseOj
end
