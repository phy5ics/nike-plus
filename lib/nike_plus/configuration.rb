require 'logger'
require 'nike_plus/version'

module NikePlus
  module Configuration
    VALID_OPTIONS_KEYS = [
      :adapter,
      :serial_port,
			:baud_rate,
			:timeout,
			:logger_level].freeze

    DEFAULT_ADAPTER = 'TBD'
    DEFAULT_SERIAL_PORT = '/dev/tty.usbserial-A100RUVN'
		DEFAULT_BAUD_RATE = 57600
		DEFAULT_TIMEOUT = 10
		DEFAULT_LOGGER_LEVEL = Logger::ERROR

    attr_accessor(*VALID_OPTIONS_KEYS)

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end

    def device=(value)
      @device = File.join(value, "")
    end

    def reset
      self.adapter = DEFAULT_ADAPTER
      self.serial_port = DEFAULT_SERIAL_PORT
			self.baud_rate = DEFAULT_BAUD_RATE
			self.timeout = DEFAULT_TIMEOUT
			self.logger_level = DEFAULT_LOGGER_LEVEL
    end
  end
end