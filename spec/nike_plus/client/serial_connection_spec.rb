require 'spec_helper'
require 'logger'

describe NikePlus::Client::SerialConnection do

  describe "serial_connection" do
    before do
			@client = NikePlus::Client.new serial_port: '/dev/tty.usbserial-A100RUVN', logger_level: Logger::DEBUG
    end
    
    it "should handshake with the device" do
			@client.open
			@client.start_reading
    end

		it "should start reading data from the device" do
			
    end

		#it "should close the serial port" do
		#	proc {
		#		client = NikePlus::Client.new
		#		client.close
		#	}.should_not raise_exception
		#end

    #it "should be set " do
    #  NikePlus.serial_port = '/dev/tty.usbserial-SOMEOTHERPORT'
    #  client = NikePlus::Client.new
    #  client.serial_port.should == '/dev/tty.usbserial-SOMEOTHERPORT'
    #end
  end
end