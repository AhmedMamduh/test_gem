require "sopra/version"

module Sopra
  class Error < StandardError; end
  class Configuration
    attr_accessor :atts
    def initialize(atts = {})
      @atts = atts
    end

    def set(key = nil, value = nil)
      @atts[key] = value
      yield self if block_given?
    end

    def get(key)
      @atts[key]
    end

  end
end
