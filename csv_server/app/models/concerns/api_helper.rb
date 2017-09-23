require 'active_support/concern'
require "uri"
require "net/http"

module ApiHelper
  extend ActiveSupport::Concern

  HOST = 'http://127.0.0.1'
  PORT = '3000'
  URL = HOST + ":" + PORT + "/csv/process"

  module ClassMethods
    def process_csv(csv_params)
      request = Net::HTTP.post_form(URI.parse(URL), csv_params)
      return JSON.parse(request.body)
    end
  end

end