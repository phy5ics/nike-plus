require "nike_plus/version"

module NikePlus
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