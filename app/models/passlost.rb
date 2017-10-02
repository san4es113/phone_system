class Passlost < ApplicationRecord
	belongs_to :user
	
	C = 3.0*10.0**2

	#create model method for call into controller
	def self.CalculateFreeSpace frequency
		@hashh={}
		1.upto(20){ |elt|
			@hashh[10.0*Math.log10(((elt*1000.0*3.1415*4.0)**2)/((C/(frequency))**2))] = 10.0*Math.log10(elt);
		}
			@hashh
	end
	def self.CalculateOkumura (frequency ,tx_ht, rx_ht)
		@hashh={}

		@Ghr;
		case rx_ht
			when 1..3
			  @Ghr=10*Math.log10(rx_ht/3.0);
			when 3.000001..9.999
			  @Ghr=20*Math.log10(rx_ht/3.0);
			end

		1.upto(20){ |elt|
			@hashh[(20.0*Math.log10(((C/(frequency))**2)/((elt*1000.0*3.1415*4.0)**2)))+5.0-20.0*Math.log10(tx_ht/200.0)-@Ghr-9.0] = 10.0*Math.log10(elt);
		}
			@hashh
	end
end
