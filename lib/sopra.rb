require "sopra/version"
require "byebug"

module Sopra
  class Error < StandardError; end
  class Configuration
    attr_accessor :atts
    def initialize(atts = {})
      @atts = atts
    end

    def set(key = nil, value = nil)
      @atts[key] = value.is_a?(Proc) ? value.call : value
    end

    def get(key)
      @atts[key]
    end

  end
end
