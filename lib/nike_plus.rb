require 'nike_plus/version'
require 'nike_plus/configuration'
require 'nike_plus/client'

module NikePlus
  extend Configuration
  class << self
    # Alias for NikePlus::Client.new
    #
    # @return [NikePlus::Client]
    def new(options={})
      NikePlus::Client.new(options)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end