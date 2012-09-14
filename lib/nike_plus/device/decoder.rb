module NikePlus
  class Device
    module Decoder
			def decode message
				Packet.new message.split ' '
			end
			
			class Packet
				attr_accessor :device_id
				attr_accessor :hours_on
				attr_accessor :running_step_count
				attr_accessor :walking_step_count
				attr_accessor :walking_miles
				attr_accessor :running_miles
				
				def initialize message
					@device_id = message[5..8].join ' '
				end

			end
			
		end
	end
end