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

	def self.CalculateHata (frequency ,tx_ht, rx_ht)
		@hashh={}

		@par_h=3.2*((Math.log10(11.75*rx_ht))**2)-4.97;
		1.upto(20){ |elt|
			@hashh[69.55+26.16*Math.log10(frequency*10.0**6)-13.82*Math.log10(tx_ht)-@par_h+((44.9-6.55*Math.log10(tx_ht)))*(Math.log10(elt))] = 10.0*Math.log10(elt);
		}
			@hashh
	end
	def self.CalculateLee (frequency ,tx_ht, rx_ht)
		@Lee_Philadenphia={}
		@Lee_Newark={}
		@Lee_Tokyo={}

		@alph1=(tx_ht/30.48)**2;
		@alph2=(rx_ht/3);
		@alph3=1;
		@alph4=10**(6/40); # Base Statino antenna gain is 6/4 dB corresponding to 10^(6/40) actual value
		@alph5=0.25; # alpha5=-6dB corresponding to 0.25 actual value
		@alph0=@alph1*@alph2*@alph3*@alph4*@alph5;

		1.upto(20){ |elt|
			@Lee_Philadenphia[108.49+36.8*(Math.log10(Math.log10(elt)/1.6))+10*3*Math.log10(frequency/900.0)-@alph0]= 10.0*Math.log10(elt);
			@Lee_Newark[101.20+43.1*(Math.log10(Math.log10(elt)/1.6))+10.0*3.0*Math.log10(frequency/900.0)-@alph0]= 10.0*Math.log10(elt);
			@Lee_Tokyo[123.77+30.5*(Math.log10(Math.log10(elt)/1.6))+10.0*3.0*Math.log10(frequency/900.0)-@alph0]= 10.0*Math.log10(elt);
		}
			[@Lee_Philadenphia,@Lee_Newark,@Lee_Tokyo]
	end
end
