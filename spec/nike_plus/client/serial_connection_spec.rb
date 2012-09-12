require 'spec_helper'

describe NikePlus::Client::SerialConnection do

  describe "serial_connection" do
    before do
			@client = NikePlus::Client.new serial_port: '/dev/tty.usbserial-A100RUVN'
			
    end
    
    it "should read a byte from the serial port" do
			@client.open
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