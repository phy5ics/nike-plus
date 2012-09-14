require 'logger'
require 'nike_plus/device/serial_connection'
require 'nike_plus/device/decoder'

module NikePlus
  class Device
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

		include NikePlus::Device::SerialConnection
		include NikePlus::Device::Decoder
	
	end
end