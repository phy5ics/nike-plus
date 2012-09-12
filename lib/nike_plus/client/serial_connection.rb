require 'serialport'

module NikePlus
  class Client
    module SerialConnection
			attr_reader :conn
	
      def open
        puts "Serial connection opening"
				puts NikePlus.serial_port
				puts NikePlus.baud_rate
        @conn = SerialPort.new(NikePlus.serial_port, NikePlus.baud_rate)
      end
      
      def close
        puts "Serial connection closing"
				@conn.close
      end
    end
  end
end