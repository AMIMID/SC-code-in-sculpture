(
s.options.numWireBufs = 1024*4;
s.options.numOutputBusChannels=8;
s.options.numInputBusChannels=0;
s.options.memSize = 8192*32;
//s.options.blockSize = 64/4;
s.options.maxNodes = 1024 * 4;
s.waitForBoot
)

////constant 5v can be given with wavetable osc
/////wavetables


(
///direction/needs constant +5V or constant GND
{Out.ar(1,Osc.ar(~w,freq:1,mul:10,phase:0.0))}.play
)
(
///direction/needs constant +5V or constant GND
x={Out.ar(1,LFPulse.ar(freq: 1000, iphase: 0, width: 0.1, mul: 1))}.play
)
x.free
(
/////control
{
var env,envdir;
	//env=EnvGen.ar(Env.new([0,0,1,1,0],[0.1,0,20,0]),doneAction:2);
//	envdir=EnvGen.ar(Env.new([0,0,1,1,0],[0.1,0,0.1 ,0]));
Out.ar(0,LFPulse.ar(freq: 200, iphase: 0, width: 0.5, mul: 1));

	}.play
)

////8channels means 8 stepper motors or 4 if the half 4 are used as direction pins
