require 'nike_plus/client/serial_connection'

module NikePlus
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options={})
      options = NikePlus.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

		include NikePlus::Client::SerialConnection
	
	end
end