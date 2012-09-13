require 'logger'
require 'nike_plus/client/serial_connection'

module NikePlus
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)
		attr_accessor :log

    def initialize(options={})
      options = NikePlus.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
			@log = Logger.new(STDOUT)
			@log.level = self.logger_level
    end

		include NikePlus::Client::SerialConnection
	
	end
end