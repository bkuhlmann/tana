# frozen_string_literal: true

require "inspectable"

module Tana
  module Configuration
    # Defines the content of the client configuration for API requests.
    Content = Struct.new(:accept, :token, :url) { include Inspectable[token: :redact] }
  end
end
