require 'serialport'
require 'hex_string'

module NikePlus
  class Client
    module SerialConnection
			attr_accessor :conn, :connected, :reading
	
      def open
				log.info "Attempting to open serial connection with device on #{NikePlus.serial_port} at #{NikePlus.baud_rate} baud"
        @device = SerialPort.new NikePlus.serial_port, NikePlus.baud_rate
				handshake
      end

			def handshake
				log.info "Starting device handshake"
				send_handshake 'ff 55 04 09 07 00 25 c7', 'ff 55 04 09 00 00 07 ec'
				send_handshake 'ff 55 02 09 05 f0', 'ff 55 04 09 06 00 25 c8'
				log.info "Device initialized"
			end
			
			def send_handshake message, expected_response
				log.info "Sending first handshake"
				begin
					@device.write message.to_byte_string
					bytes = @device.read 8
					log.debug "Received response: #{bytes.to_hex_string}"
				rescue
					log.error "Unexpected result from device, retrying"
					retry if bytes.to_hex_string != expected_response
				end
				log.info "Response OK"
				@connected = true
			end
			
			def start_reading
				log.info "Reading from serial"
				@reading = true
				begin
					byte = @device.read 1
					if byte
						message = @device.read 33
						log.debug message.to_hex_string
						message.to_hex_string
					end
				end while @reading == true
			end
			
			def stop_reading
				log.info "Stopped reading from serial"
				@reading = false
			end
			
			def close
				log.info "Closing serial connection"
        @device.close
				@reading = false
				@connected = false
      end
			
    end
  end
end