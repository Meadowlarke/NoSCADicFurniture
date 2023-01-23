# Notes

## Plasma settings

100ipm, 50 Amps, standard 45 amp nozzle. height was probably Artisans standard of 0.06+0.08, pressure was artisans standard of 70?

Looking at the charts again I messed up for 1/8 steel plate, it should have been 160 ipm for the standard nozzle, or 100 for the fine cut, which is where I messed up. Next time I will try the fine cut nozzle.  

The piece had a slight positive cut angle, so it can be moved closer, but I will try the fine cut nozzle first. 

### 1/16/2023

50A 5.0bar 45 amp fine cut, 140 in/min. Manual mode, 125V. Init cut height 0.14, pierce height .24. 

Tool 8.  

AMAZing quality. Very little cut angle. Very clean. A little bit of slag when the holes start and stop.  

##

I am also noticing that the plasma cutter shrinks any hole by about 2mm in diameter. I have updated the .SCAD file appropriately.  

## 1/17/2023

I tried 145 imp.Incomplete cuts, ugly curve in cut line. not good

Oh.... The air compressor was just turned off.... 

Great results with: 50A, 5.0 bar 45 amp fine cut, 140 in/min, AUTO HEIGHT CONTROL, 70 volts, init cut height 0.14, pierce height .22, cut delay .4

It was a great success getting the auto height control working. I got there by setting the volts to 70 (based on watching the voltage while cutting in manual). I started playing with changing the pierce settings to try to reduce the size of the pierce hole. I reduced the cut height and delay a tiny bit, to a slight improvement, but was afraid of damaging my last couple fine-cut tis. 
