import os,sys
import numpy as np
import struct
import scipy.stats as stats
from scipy.signal import argrelextrema
import matplotlib
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt
from scipy import optimize
from scipy import signal
from scipy import interpolate

y_formatter = matplotlib.ticker.ScalarFormatter(useOffset=False)

class pipeline(object):
    def __init__(self):
        ######## Target Sweeps ############
        #self.targ_path = raw_input('Absolute path to known good target sweep dir (e.g. /home/olimpo/olimpo_readout/sweeps/target/0805_1): ' )
	self.noise_root_path = '/home/lazarus/sam_git/blast_readout/data/noise_measurements_0811'
	"""
	self.accum_freq = 256.0e6 / (2**20)
	self.targ_path = '/home/lazarus/sam_git/olimpo_readout/sweeps/target/0804_3'
	data_files=[f for f in sorted(os.listdir(self.targ_path)) if f.endswith('.npy')]
        I = np.array([np.load(os.path.join(self.targ_path,f)) for f in data_files if f.startswith('I')])
        Q = np.array([np.load(os.path.join(self.targ_path,f)) for f in data_files if f.startswith('Q')])
	self.lo_freqs = np.load(self.targ_path + '/sweep_freqs.npy')
        self.raw_chan = I + 1j*Q
        #self.chan_ts /= (2**15 - 1)
	#self.chan_ts /= ((2**21 - 1) / 2048)
	self.nchan = len(self.raw_chan[0])
        self.cm = plt.cm.spectral(np.linspace(0.05,0.95,self.nchan))
        self.raw_I = self.raw_chan.real
        self.raw_Q = self.raw_chan.imag
        self.mag = np.abs(self.raw_chan)
        self.phase = np.angle(self.raw_chan)
        self.centers=self.loop_centers(self.raw_chan) # returns self.centers
	self.chan_centered = self.raw_chan - self.centers
        self.rotations = np.angle(self.chan_centered[self.chan_centered.shape[0]/2])
	self.chan_rotated = self.chan_centered * np.exp(-1j*self.rotations)
        self.phase_rotated = np.angle(self.chan_rotated)
        self.bb_freqs = np.load(self.targ_path + '/bb_freqs.npy')
        self.delta_lo = 2.5e3
	prompt = raw_input('Save phase centers and rotations in ' + self.targ_path + ' (**** MAY OVERWRITE ****) (y/n)? ')
	if prompt == 'y':
		np.save(self.targ_path + '/centers.npy', self.centers)
        	np.save(self.targ_path + '/rotations.npy', self.rotations)
	"""
    def open_stored(self, save_path = None):
        files = sorted(os.listdir(save_path))
        sweep_freqs = np.array([np.float(filename[1:-4]) for filename in files if (filename.startswith('I'))])
        I_list = [os.path.join(save_path, filename) for filename in files if filename.startswith('I')]
        Q_list = [os.path.join(save_path, filename) for filename in files if filename.startswith('Q')]
        Is = np.array([np.load(filename) for filename in I_list])
        Qs = np.array([np.load(filename) for filename in Q_list])
        return sweep_freqs, Is, Qs

    def loop_centers(self,timestream):
        def least_sq_circle_fit(chan):
            """
            Least squares fitting of circles to a 2d data set. 
            Calcultes jacobian matrix to speed up scipy.optimize.least_sq. 
            Complements to scipy.org
            Returns the center and radius of the circle ((xc,yc), r)
            """
            #x=self.i[:,chan]
            #y=self.q[:,chan]
            x=timestream[:,chan].real
            y=timestream[:,chan].imag
            xc_guess = x.mean()
            yc_guess = y.mean()
                        
            def calc_radius(xc, yc):
                """ calculate the distance of each data points from the center (xc, yc) """
                return np.sqrt((x-xc)**2 + (y-yc)**2)
    
            def f(c):
                """ calculate f, the algebraic distance between the 2D points and the mean circle centered at c=(xc, yc) """
                Ri = calc_radius(*c)
                return Ri - Ri.mean()
    
            def Df(c):
                """ Jacobian of f.The axis corresponding to derivatives must be coherent with the col_deriv option of leastsq"""
                xc, yc = c
                dfdc = np.empty((len(c), x.size))
                Ri = calc_radius(xc, yc)
                dfdc[0] = (xc - x)/Ri            # dR/dxc
                dfdc[1] = (yc - y)/Ri            # dR/dyc
                dfdc = dfdc - dfdc.mean(axis=1)[:, np.newaxis]
                return dfdc
        
            (xc,yc), success = optimize.leastsq(f, (xc_guess, yc_guess), Dfun=Df, col_deriv=True)
        
            Ri = calc_radius(xc,yc)
            R = Ri.mean()
            residual = sum((Ri - R)**2) #error in fit if needed
            #print xc_guess,yc_guess,xc,yc
            return (xc,yc),R

        centers=[]
        for chan in range(self.nchan):
                (xc,yc),r = least_sq_circle_fit(chan)
                centers.append(xc+1j*yc)
        #self.centers = np.array(centers)
        return np.array(centers)

    def plot_loop_centered(self,chan):
        plt.plot(self.chan_centered.real[:,chan],self.chan_centered.imag[:,chan],'x',color=self.cm[chan])
        plt.gca().set_aspect('equal')
        plt.xlim(np.std(self.chan_centered.real[:,chan])*-3,np.std(self.chan_centered.real[:,chan]*3))
        plt.ylim(np.std(self.chan_centered.imag[:,chan])*-3.,np.std(self.chan_centered.imag[:,chan]*3))
        plt.tight_layout()
	plt.show()
        return

    def plot_loop_rotated(self,chan):
        plt.figure(figsize = (20,20))
        plt.title('IQ loop Channel = ' + str(chan) + ', centered and rotated')
        plt.plot(self.chan_rotated.real[:,chan],self.chan_rotated.imag[:,chan],'x',color='red',mew=2, ms=6)
        plt.gca().set_aspect('equal')
        plt.xlim(np.std(self.chan_rotated.real[:,chan])*-3,np.std(self.chan_rotated.real[:,chan])*3)
        plt.ylim(np.std(self.chan_rotated.imag[:,chan])*-3,np.std(self.chan_rotated.imag[:,chan])*3)
        plt.xlabel('I', size = 20)
        plt.ylabel('Q', size = 20)
        plt.tight_layout()
	plt.show()
        return

    def multiplot(self, chan):
        #for chan in range(self.nchan):
        #rf_freqs = np.load(os.path.join(self.datapath,'light_kids.npy'))
        #rf_freq= rf_freqs[chan] - (np.max(rf_freqs) + np.min(rf_freqs))/2. + self.lo_freqs
        #print np.shape(rf_freq)
        rf_freqs = (self.bb_freqs[chan] + (self.lo_freqs/2))/1.0e6
	self.mag /= (2**15 - 1)
	self.mag /= ((2**21 - 1) / 2048)
        fig,axs = plt.subplots(1,3, figsize = (20, 12))
	axs[0].set_title('Amplitude', size = 25)
	axs[0].set_ylabel('dB', size = 25)
	axs[0].plot(rf_freqs, 20*np.log10(self.mag[:,chan]),'#8B0000', linewidth = 2)
	axs[0].tick_params(axis='y', labelsize=23) 
	axs[0].get_xaxis().set_visible(False)
	plt.grid()

	axs[1].set_title('Phase', size = 25)
	axs[1].set_ylabel('rad', size = 25)
        axs[1].plot(rf_freqs, self.phase_rotated[:,chan],'#8B0000',linewidth = 2)
	axs[1].get_xaxis().set_visible(False)
	axs[1].tick_params(axis='y', labelsize=23) 
	plt.grid()

	axs[2].set_title('I/Q loop', size = 25)
        axs[2].plot(self.chan_rotated[:,chan].real/np.max(self.chan_rotated[:,chan]),self.chan_rotated[:,chan].imag/np.max(self.chan_rotated[:,chan]),'#8B0000',marker='x', linewidth = 2)
	axs[2].get_xaxis().set_visible(False)
	axs[2].tick_params(axis='y', labelsize=23) 
        axs[2].axis('equal')                    
        plt.grid()            
        plt.tight_layout()
	plt.savefig('/home/lazarus/sam_git/multiplot.pdf', bbox = 'tight')
        plt.show()         
        return

    def plot_targ(self, path):
    	plt.ion()
	plt.figure(6)
	plt.clf()
	lo_freqs, Is, Qs = self.open_stored(path)
	lo_freqs = np.load(path + '/sweep_freqs.npy')
	bb_freqs = np.load(path + '/bb_freqs.npy')
	channels = len(bb_freqs)
	mags = np.zeros((channels,len(lo_freqs))) 
	chan_freqs = np.zeros((channels,len(lo_freqs)))
        new_targs = np.zeros((channels))
	for chan in range(channels):
        	mags[chan] = np.sqrt(Is[:,chan]**2 + Qs[:,chan]**2)
		mags[chan] /= 2**15 - 1
		mags[chan] /= ((2**21 - 1) / 512.)
		mags[chan] = 20*np.log10(mags[chan])
		chan_freqs[chan] = (lo_freqs/2 + bb_freqs[chan])/1.0e6
	mags = np.concatenate((mags[len(mags)/2:],mags[:len(mags)/2]))
	#bb_freqs = np.concatenate(bb_freqs[len(b_freqs)/2:],bb_freqs[:len(bb_freqs)/2]))
	chan_freqs = np.concatenate((chan_freqs[len(chan_freqs)/2:],chan_freqs[:len(chan_freqs)/2]))
	#new_targs = [chan_freqs[chan][np.argmin(mags[chan])] for chan in range(channels)]
	#print new_targs
	for chan in range(channels):
		plt.plot(chan_freqs[chan],mags[chan])
	plt.title('Target sweep')
	plt.xlabel('frequency (MHz)')
        plt.ylabel('dB')
	return


    def plotPSD(self, chan, time_interval):
	path1 = os.path.join(self.noise_root_path, "chan1_120")
	path2 = os.path.join(self.noise_root_path, "chan100_120")
	path3 = os.path.join(self.noise_root_path, "chan500_120")
	path4 = os.path.join(self.noise_root_path, "chan1000_120_7")
	
	with open(os.path.join(path1, "chP_0"), "rb") as file1:
		chan1 = file1.read()
	with open(os.path.join(path2, "chP_avg_100"), "rb") as file2:
		chan100 = file2.read()
	with open(os.path.join(path3, "chP_avg_500"), "rb") as file3:
		chan500 = file3.read()
	with open(os.path.join(path4, "chP_avg_1000"), "rb") as file4:
		chan1000 = file4.read()
	phases1 = struct.unpack(str(len(chan1)/4) + "f", chan1)
	phases100 = struct.unpack(str(len(chan100)/4) + "f", chan100)
	phases500 = struct.unpack(str(len(chan500)/4) + "f", chan500)
	phases1000 = struct.unpack(str(len(chan1000)/4) + "f", chan1000)
	Npackets = len(phases1)
	plot_range = (Npackets / 2) + 1
	figure = plt.figure(num= None, figsize=(20,12), dpi=200, facecolor='w', edgecolor='w')
	ax = figure.add_subplot(1,1,1)
	ax.set_xscale('log')
	ax.set_ylim((-160,-50))
        plt.xlim((0.01, self.accum_freq/2.))
        ax.set_ylabel('dBc/Hz', size = 28)
        ax.set_xlabel('log Hz', size = 28)
	ax.tick_params(axis='x', labelsize=25) 
	ax.tick_params(axis='y', labelsize=25) 
	plt.grid()
	
	phases1 -= np.mean(phases1)
	phases100 -= np.mean(phases100)
	phases500 -= np.mean(phases500)
	phases1000 -= np.mean(phases1000)
	phase_fft = np.fft.rfft(phases1)
	phase_fft100= np.fft.rfft(phases100)
	phase_fft500 = np.fft.rfft(phases500)
	phase_fft1000= np.fft.rfft(phases1000)
	
	psd1 = (np.abs(phase_fft)**2) * (1./self.accum_freq) / Npackets
	psd1 = 10*np.log10(psd1)
	psd100 = (np.abs(phase_fft100)**2) * (1./self.accum_freq) / Npackets
	psd100 = 10*np.log10(psd100)
	psd500 = (np.abs(phase_fft500)**2) * (1./self.accum_freq) / Npackets
	psd500 = 10*np.log10(psd500)
	psd1000 = (np.abs(phase_fft1000)**2) * (1./self.accum_freq) / Npackets
	psd1000 = 10*np.log10(psd1000)
	
	ax.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), psd1, color = 'black', linewidth = 1, label = "1 chan")
	ax.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), psd100, color = 'b', alpha = 0.8,  linewidth = 1, label = "100 chan")
	ax.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), psd500, color = 'r', alpha = 0.6,  linewidth = 1, label = "500 chan")
	ax.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), psd1000, color = 'g', alpha = 0.4,  linewidth = 1, label = "1000 chan")
	plt.legend(loc = 'lower left', fontsize = 28)
	plt.savefig('/home/lazarus/sam_git/blast_readout/data/multi_chan.pdf', bbox = 'tight')
	plt.show()
	return
    
    def plotPSD_all_chan(self, time_interval):
	Npackets = np.int(time_interval * self.accum_freq)
	
	#path_1 = os.path.join(self.noise_root_path, "chan1_all_60")
	path_10 = os.path.join(self.noise_root_path, "chan10_all_60")
	fft_array_10 = np.zeros((10, Npackets/2 + 1))
	psd_array_10 = np.zeros((10, Npackets/2 + 1))
	path_50 = os.path.join(self.noise_root_path, "chan50_all_60")
	psd_array_50 = np.zeros((50, Npackets/2 + 1))
	fft_array_50 = np.zeros((50, Npackets/2 + 1))
	path_100 = os.path.join(self.noise_root_path, "chan100_all_60")
	fft_array_100 = np.zeros((100, Npackets/2 + 1))
	psd_array_100 = np.zeros((100, Npackets/2 + 1))
	path_250 = os.path.join(self.noise_root_path, "chan250_all_60")
	fft_array_250 = np.zeros((250, Npackets/2 + 1))
	psd_array_250 = np.zeros((250, Npackets/2 + 1))
	path_500 = os.path.join(self.noise_root_path, "chan500_all_60")
	psd_array_500 = np.zeros((500, Npackets/2 + 1))
	fft_array_500 = np.zeros((500, Npackets/2 + 1))
	path_1000 = os.path.join(self.noise_root_path, "chan1000_all_60")
	fft_array_1000 = np.zeros((1000, Npackets/2 + 1))
	psd_array_1000 = np.zeros((1000, Npackets/2 + 1))
	
	#with open(os.path.join(path_1, "chP_0"), "rb") as f_1:
	#	phase_1 = f_1.read()
	#	phases_1 = struct.unpack(str(len(phase_1)/4) + "f", phase_1)
	#	phases_1 -= np.mean(phases_1)
	#	fft_1 = np.fft.rfft(phases_1)
	#	psd_1 = 10*np.log10((np.abs(fft_1)**2) * (1./self.accum_freq) / Npackets)
	#	f_1.close()	
	for chan in range(10):
		with open(os.path.join(path_10, "chP_" + str(chan)), "rb") as f_10:
			phase_10 = f_10.read()
			phases_10 = struct.unpack(str(len(phase_10)/4) + "f", phase_10)
			phases_10 -= np.mean(phases_10)
			fft_array_10[chan] = np.fft.rfft(phases_10)
			psd_array_10[chan] = 10.0*np.log10((np.abs(fft_array_10[chan])**2) * (1./self.accum_freq) / Npackets)
			f_10.close()	
	for chan in range(50):	
		with open(os.path.join(path_50, "chP_" + str(chan)), "rb") as f_50:
			phase_50 = f_50.read()
			phases_50 = struct.unpack(str(len(phase_50)/4) + "f", phase_50)
			phases_50 -= np.mean(phases_50)
			fft_array_50[chan] = np.fft.rfft(phases_50)
			psd_array_50[chan] = 10.0*np.log10((np.abs(fft_array_50[chan])**2) * (1./self.accum_freq) / Npackets)
			f_50.close()	
	for chan in range(100):
		with open(os.path.join(path_100, "chP_" + str(chan)), "rb") as f_100:
			phase_100 = f_100.read()
			phases_100 = struct.unpack(str(len(phase_100)/4) + "f", phase_100)
			phases_100 -= np.mean(phases_100)
			fft_array_100[chan] = np.fft.rfft(phases_100)
			psd_array_100[chan] = 10.0*np.log10((np.abs(fft_array_100[chan])**2) * (1./self.accum_freq) / Npackets)
			f_100.close()	
	for chan in range(250):	
		with open(os.path.join(path_250, "chP_" + str(chan)), "rb") as f_250:
			phase_250 = f_250.read()
			phases_250 = struct.unpack(str(len(phase_250)/4) + "f", phase_250)
			phases_250 -= np.mean(phases_250)
			fft_array_250[chan] = np.fft.rfft(phases_250)
			psd_array_250[chan] = 10.0*np.log10((np.abs(fft_array_250[chan])**2) * (1./self.accum_freq) / Npackets)
			f_250.close()	
	for chan in range(500):	
		with open(os.path.join(path_500, "chP_" + str(chan)), "rb") as f_500:
			phase_500 = f_500.read()
			phases_500 = struct.unpack(str(len(phase_500)/4) + "f", phase_500)
			phases_500 -= np.mean(phases_500)
			fft_array_500[chan] = np.fft.rfft(phases_500)
			psd_array_500[chan] = 10.0*np.log10((np.abs(fft_array_500[chan])**2) * (1./self.accum_freq) / Npackets)
			f_500.close()	
	for chan in range(1000):	
		with open(os.path.join(path_1000, "chP_" + str(chan)), "rb") as f_1000:
			phase_1000 = f_1000.read()
			phases_1000 = struct.unpack(str(len(phase_1000)/4) + "f", phase_1000)
			phases_1000 -= np.mean(phases_1000)
			fft_array_1000[chan] = np.fft.rfft(phases_1000)
			psd_array_1000[chan] = 10.0*np.log10((np.abs(fft_array_1000[chan])**2) * (1./self.accum_freq) / Npackets)
			f_1000.close()	
	avg_psd_10 = np.mean(psd_array_10, axis = 0)
	avg_psd_50 = np.mean(psd_array_50, axis = 0)
	avg_psd_100 = np.mean(psd_array_100, axis = 0)
	avg_psd_250 = np.mean(psd_array_250, axis = 0)
	avg_psd_500 = np.mean(psd_array_500, axis = 0)
	avg_psd_1000 = np.mean(psd_array_1000, axis = 0)
	
	#plt.ion()
	#plt.clf()
	figure = plt.figure(num=1, figsize=(20,12), dpi=200, facecolor='w', edgecolor='w')
	ax1 = figure.add_subplot(1,1,1)
	ax1.set_xscale('log')
	ax1.set_ylim((-150,-70))
        ax1.set_xlim((0.01, self.accum_freq/2.))
	ax1.set_ylabel('dBc/Hz', size = 28)
        ax1.set_xlabel('log Hz', size = 28)
	ax1.tick_params(axis='x', labelsize=25) 
	ax1.tick_params(axis='y', labelsize=25) 
	plt.grid()
	ax1.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), avg_psd_10, color = 'k', linewidth = 1, label = '10')
	ax1.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), avg_psd_50, color = 'c', alpha = 0.8, linewidth = 1, label = '50')
	ax1.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), avg_psd_100, color = 'b', alpha = 0.7, linewidth = 1, label = '100')
	ax1.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), avg_psd_250, color = 'm', alpha = 0.7, linewidth = 1, label = '250')
	ax1.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), avg_psd_500, color = 'r', alpha = 0.6, linewidth = 1, label = '500')
	ax1.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), avg_psd_1000, color = 'g', alpha = 0.5, linewidth = 1, label = '1000')
	plt.legend(loc = 'lower left', fontsize = 28)
	plt.savefig('/home/lazarus/sam_git/blast_readout/data/avg_psd.pdf', bbox = 'tight')
	
	time_vals = np.linspace(0, self.accum_freq/2., (Npackets/2) + 1)
	
	new_avg_10 = np.mean(avg_psd_10[np.where(time_vals > 0.1)[0][0]:np.where(time_vals > 100)[0][0]])
	new_avg_50 = np.mean(avg_psd_50[np.where(time_vals > 0.1)[0][0]:np.where(time_vals > 100)[0][0]])
	new_avg_100 = np.mean(avg_psd_100[np.where(time_vals > 0.1)[0][0]:np.where(time_vals > 100)[0][0]])
	new_avg_250 = np.mean(avg_psd_250[np.where(time_vals > 0.1)[0][0]:np.where(time_vals > 100)[0][0]])
	new_avg_500 = np.mean(avg_psd_500[np.where(time_vals > 0.1)[0][0]:np.where(time_vals > 100)[0][0]])
	new_avg_1000 = np.mean(avg_psd_1000[np.where(time_vals > 0.1)[0][0]:np.where(time_vals > 100)[0][0]])

	avgs = np.array([new_avg_10, new_avg_50, new_avg_100, new_avg_250, new_avg_500, new_avg_1000])
	chans = np.array([10,50,100,250,500,1000])
	
	figure2 = plt.figure(num=2, figsize=(20,12), dpi=200, facecolor='w', edgecolor='w')
	ax2 = figure2.add_subplot(1,1,1)
	ax2.set_ylabel('dBc/Hz', size = 28)
        ax2.set_xlabel('Number of Channels', size = 28)
	ax2.set_xscale('log')
	ax2.tick_params(axis='x', labelsize=25) 
	ax2.tick_params(axis='y', labelsize=25) 
	ax2.plot(chans, avgs, 'b')
	ax2.plot(chans, avgs, 'r*')
	plt.xlim((0,1010))
	plt.grid()
	plt.savefig('/home/lazarus/sam_git/blast_readout/data/nchan_v_noise.pdf', bbox = 'tight')
	plt.show()
	return

    def plotPSD_all_chan(self, time_interval):
	Npackets = np.int(time_interval * self.accum_freq)
	
	#path_1 = os.path.join(self.noise_root_path, "chan1_all_60")
	"""
	path_10 = os.path.join(self.noise_root_path, "chan10_all_60")
	fft_array_10 = np.zeros((10, Npackets/2 + 1))
	psd_array_10 = np.zeros((10, Npackets/2 + 1))
	path_50 = os.path.join(self.noise_root_path, "chan50_all_60")
	psd_array_50 = np.zeros((50, Npackets/2 + 1))
	fft_array_50 = np.zeros((50, Npackets/2 + 1))
	"""
	path_100 = os.path.join(self.noise_root_path, "chan100_all_300")
	fft_array_100 = np.zeros((100, Npackets/2 + 1))
	psd_array_100 = np.zeros((100, Npackets/2 + 1))
	path_250 = os.path.join(self.noise_root_path, "chan250_all_300")
	fft_array_250 = np.zeros((250, Npackets/2 + 1))
	psd_array_250 = np.zeros((250, Npackets/2 + 1))
	path_500 = os.path.join(self.noise_root_path, "chan500_all_300")
	psd_array_500 = np.zeros((500, Npackets/2 + 1))
	fft_array_500 = np.zeros((500, Npackets/2 + 1))
	path_1000 = os.path.join(self.noise_root_path, "chan1000_all_300")
	fft_array_1000 = np.zeros((1000, Npackets/2 + 1))
	psd_array_1000 = np.zeros((1000, Npackets/2 + 1))
	
	#with open(os.path.join(path_1, "chP_0"), "rb") as f_1:
	#	phase_1 = f_1.read()
	#	phases_1 = struct.unpack(str(len(phase_1)/4) + "f", phase_1)
	#	phases_1 -= np.mean(phases_1)
	#	fft_1 = np.fft.rfft(phases_1)
	#	psd_1 = 10*np.log10((np.abs(fft_1)**2) * (1./self.accum_freq) / Npackets)
	#	f_1.close()	
	"""
	for chan in range(10):
		with open(os.path.join(path_10, "chP_" + str(chan)), "rb") as f_10:
			phase_10 = f_10.read()
			phases_10 = struct.unpack(str(len(phase_10)/4) + "f", phase_10)
			phases_10 -= np.mean(phases_10)
			fft_array_10[chan] = np.fft.rfft(phases_10)
			psd_array_10[chan] = 10.0*np.log10((np.abs(fft_array_10[chan])**2) * (1./self.accum_freq) / Npackets)
			f_10.close()	
	for chan in range(50):	
		with open(os.path.join(path_50, "chP_" + str(chan)), "rb") as f_50:
			phase_50 = f_50.read()
			phases_50 = struct.unpack(str(len(phase_50)/4) + "f", phase_50)
			phases_50 -= np.mean(phases_50)
			fft_array_50[chan] = np.fft.rfft(phases_50)
			psd_array_50[chan] = 10.0*np.log10((np.abs(fft_array_50[chan])**2) * (1./self.accum_freq) / Npackets)
			f_50.close()	
	"""
	for chan in range(100):
		with open(os.path.join(path_100, "chP_" + str(chan)), "rb") as f_100:
			phase_100 = f_100.read()
			phases_100 = struct.unpack(str(len(phase_100)/4) + "f", phase_100)
			phases_100 -= np.mean(phases_100)
			fft_array_100[chan] = np.fft.rfft(phases_100)
			psd_array_100[chan] = 10.0*np.log10((np.abs(fft_array_100[chan])**2) * (1./self.accum_freq) / Npackets)
			f_100.close()	
	for chan in range(250):	
		with open(os.path.join(path_250, "chP_" + str(chan)), "rb") as f_250:
			phase_250 = f_250.read()
			phases_250 = struct.unpack(str(len(phase_250)/4) + "f", phase_250)
			phases_250 -= np.mean(phases_250)
			fft_array_250[chan] = np.fft.rfft(phases_250)
			psd_array_250[chan] = 10.0*np.log10((np.abs(fft_array_250[chan])**2) * (1./self.accum_freq) / Npackets)
			f_250.close()	
	for chan in range(500):	
		with open(os.path.join(path_500, "chP_" + str(chan)), "rb") as f_500:
			phase_500 = f_500.read()
			phases_500 = struct.unpack(str(len(phase_500)/4) + "f", phase_500)
			phases_500 -= np.mean(phases_500)
			fft_array_500[chan] = np.fft.rfft(phases_500)
			psd_array_500[chan] = 10.0*np.log10((np.abs(fft_array_500[chan])**2) * (1./self.accum_freq) / Npackets)
			f_500.close()	
	for chan in range(1000):	
		with open(os.path.join(path_1000, "chP_" + str(chan)), "rb") as f_1000:
			phase_1000 = f_1000.read()
			phases_1000 = struct.unpack(str(len(phase_1000)/4) + "f", phase_1000)
			phases_1000 -= np.mean(phases_1000)
			fft_array_1000[chan] = np.fft.rfft(phases_1000)
			psd_array_1000[chan] = 10.0*np.log10((np.abs(fft_array_1000[chan])**2) * (1./self.accum_freq) / Npackets)
			f_1000.close()	
	#avg_psd_10 = np.mean(psd_array_10, axis = 0)
	#avg_psd_50 = np.mean(psd_array_50, axis = 0)
	avg_psd_100 = np.mean(psd_array_100, axis = 0)
	avg_psd_250 = np.mean(psd_array_250, axis = 0)
	avg_psd_500 = np.mean(psd_array_500, axis = 0)
	avg_psd_1000 = np.mean(psd_array_1000, axis = 0)
	
	figure = plt.figure(num=1, figsize=(20,12), dpi=200, facecolor='w', edgecolor='w')
	ax1 = figure.add_subplot(1,1,1)
	ax1.set_xscale('log')
	ax1.set_ylim((-130,-70))
        ax1.set_xlim((0.01, self.accum_freq/2.))
	ax1.set_ylabel('dBc/Hz', size = 28)
        ax1.set_xlabel('log Hz', size = 28)
	ax1.tick_params(axis='x', labelsize=25, width = 2, which = 'both') 
	ax1.tick_params(axis='y', labelsize=25, width = 2, which = 'both') 
	plt.grid()
	#ax1.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), avg_psd_10, color = 'k', linewidth = 1, label = '10')
	#ax1.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), avg_psd_50, color = 'c', alpha = 0.8, linewidth = 1, label = '50')
	ax1.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), avg_psd_100, color = 'b', alpha = 0.7, linewidth = 1, label = '100')
	ax1.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), avg_psd_250, color = 'm', alpha = 0.7, linewidth = 1, label = '250')
	ax1.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), avg_psd_500, color = 'r', alpha = 0.6, linewidth = 1, label = '500')
	ax1.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), avg_psd_1000, color = 'g', alpha = 0.5, linewidth = 1, label = '1000')
	plt.legend(loc = 'upper right', fontsize = 28)
	plt.savefig('/home/lazarus/sam_git/blast_readout/data/avg_psd_300.pdf', bbox = 'tight')
	plt.show()

    def plot_on_off(self, chan):
	root_path = '/home/lazarus/sam_git/olimpo_readout/noise_measurements_0806'
	path_off = os.path.join(root_path, "olimpo150_phase_off_res_2")
	path_on = os.path.join(root_path, "olimpo150_phase_centered_1")
	LO_freq = self.center_freq
	time_interval = 300
	#I = open(os.path.join(path, ""), "rb")
	#Q = open(os.path.join(path,""), "rb")
	with open(os.path.join(path_off, "chP_" + str(chan)), "rb") as file1:
		off = file1.read()
	with open(os.path.join(path_on, "chP_" + str(chan)), "rb") as file2:
		on = file2.read()
	phase_off = struct.unpack(str(len(off)/4) + "f", off)
	phase_on = struct.unpack(str(len(on)/4) + "f", on)
	print len(phase_off), len(phase_on)
	Npackets = len(phase_off)
        
	plot_range = (Npackets / 2) + 1
	figure = plt.figure(num= None, figsize=(20,12), dpi=200, facecolor='w', edgecolor='w')
	plt.suptitle('Chan ' + str(chan) + ' phase PSD')
	ax = figure.add_subplot(1,1,1)
	ax.set_xscale('log')
	ax.set_ylim((-150,-70))
        #plt.xlim((0.0001, self.accum_freq/2.))
        ax.set_ylabel('dBc/Hz', size = 23)
        ax.set_xlabel('log Hz', size = 23)
	ax.tick_params(axis='x', labelsize=16) 
	plt.grid()
	
	phases_on = np.fft.rfft(phase_on)
	phases_on = (np.abs(phases_on)**2 * ((1./self.accum_freq)**2 / (time_interval)))
	phases_on = 10*np.log10(phases_on)
	phases_on -= phases_on[0]
	phases_off = np.fft.rfft(phase_off)
	phases_off = (np.abs(phases_off)**2 * ((1./self.accum_freq)**2 / (time_interval)))
	phases_off = 10*np.log10(phases_off)
	phases_off -= phases_off[0]
        
	ax.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), phases_off, color = 'black', linewidth = 1, label = "Off")
	ax.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), phases_on, color = 'b', alpha = 0.5,  linewidth = 1, label = "On")
	plt.legend()
	plt.show()
	return

    def plot_on_off_avg(self):
	root_path = '/home/lazarus/sam_git/olimpo_readout/noise_measurements_0806'
	path_off = os.path.join(root_path, "olimpo150_phase_off_res_1")
	path_on = os.path.join(root_path, "olimpo150_phase_centered_1")
	LO_freq = (200.)*1.0e6
	time_interval = 300
	phase_off = np.zeros(36621)
	phase_on = np.zeros(36621)
	for chan in range(20):
		with open(os.path.join(path_off, "chP_" + str(chan)), "rb") as file1:
			off = file1.read()
		with open(os.path.join(path_on, "chP_" + str(chan)), "rb") as file2:
			on = file2.read()
		phase_off += struct.unpack(str(len(off)/4) + "f", off)
		phase_on += struct.unpack(str(len(on)/4) + "f", on)
	
	phase_off, phase_on = phase_off/20, phase_on/20
	Npackets = len(phase_off)
        
	plot_range = (Npackets / 2) + 1
	figure = plt.figure(num= None, figsize=(20,12), dpi=200, facecolor='w', edgecolor='w')
	plt.suptitle('Chan ' + str(chan) + ' phase PSD')
	ax = figure.add_subplot(1,1,1)
	ax.set_xscale('log')
	ax.set_ylim((-150,-50))
        #plt.xlim((0.0001, self.accum_freq/2.))
        ax.set_ylabel('dBc/Hz', size = 23)
        ax.set_xlabel('log Hz', size = 23)
	ax.tick_params(axis='x', labelsize=16) 
	plt.grid()
	
	phases_on = np.fft.rfft(phase_on)
	phases_on = (np.abs(phases_on)**2 * ((1./self.accum_freq)**2 / (time_interval)))
	phases_on = 10*np.log10(phases_on)
	phases_on -= phases_on[0]
	phases_off = np.fft.rfft(phase_off)
	phases_off = (np.abs(phases_off)**2 * ((1./self.accum_freq)**2 / (time_interval)))
	phases_off = 10*np.log10(phases_off)
	phases_off -= phases_off[0]
        
	ax.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), phases_off, color = 'black', linewidth = 1, label = "Off")
	ax.plot(np.linspace(0, self.accum_freq/2., (Npackets/2) + 1), phases_on, color = 'b', alpha = 0.5,  linewidth = 1, label = "On")
	plt.legend(loc = 'lower left')
	plt.show()
	phase_off = np.zeros(36621)
	return
