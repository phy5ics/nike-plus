require 'serialport'

module NikePlus
  class Client
    module SerialConnection
      def open
        puts "Serial connection opening"
        @conn = SerialPort.new(NikePlus.serial_port, NikePlus.baud_rate)
      end
      
      def close
        puts "Serial connection closing"
      end
    end
  end
end