require 'spec_helper'

describe NikePlus::Device do
  #it 'should instantiate with api key' do
  #  proc {
  #    NikePlus::Client.new(serial_port: '/dev/tty.usbserial-A100RUVN')
  #  }.should_not raise_exception
  #end

  describe "device" do
    after(:each) do
			# NikePlus::Device.close
			NikePlus.reset
    end

    #it "should default to /dev/tty.usbserial-A100RUVN" do
    #  client = NikePlus::Client.new
    #  client.serial_port.should == '/dev/tty.usbserial-A100RUVN'
    #end
    
    it "should open the serial port" do
			proc {
				@device = NikePlus::Device.new serial_port: '/dev/tty.usbserial-A100RUVN'
			}.should_not raise_exception
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