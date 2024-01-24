# frozen_string_literal: true

module Tana
  module Configuration
    # Defines the content of the client configuration for API requests.
    Content = Struct.new :accept, :token, :url
  end
end
