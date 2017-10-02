class Passlost < ApplicationRecord
	belongs_to :user
	
	C = 3.0*10.0**2

	#create model method for call into controller
	def self.CalculateFreeSpace frequency
		@hashh={}
		1.upto(20){ |elt|
			@hashh[10*Math.log10(((elt*1000*3.1415*4)**2)/((C/(frequency*10**6))**2))] = 10*Math.log10(elt);
		}
			@hashh
	end

end
