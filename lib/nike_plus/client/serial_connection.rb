require 'serialport'
require 'hex_string'

module NikePlus
  class Client
    module SerialConnection
			attr_accessor :conn
	
      def open
        puts "Serial connection opening"
				puts NikePlus.serial_port
				puts NikePlus.baud_rate
        @device = SerialPort.new(NikePlus.serial_port, NikePlus.baud_rate)
				handshake
      end

			def handshake
				puts "Starting device handshake"
				
				@device.write 'ff 55 04 09 07 00 25 c7'.to_byte_string
				bytes = @device.read 8
				puts bytes.to_hex_string
				
				@device.write 'ff 55 02 09 05 f0'.to_byte_string
				bytes = @device.read 8
				puts bytes.to_hex_string
				
				puts "Nike+ Initialized"
				
				# puts byte[0..8].to_hex_string
			end
      
      def close
				puts "Serial connection closing"
        @device.close
      end

			def write
				puts "Serial write"
				@device.write
			end
			
			def read
				puts "Serial readline"
				@device.readline
			end
    end
  end
end