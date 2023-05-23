# Plasma 101 CAM activity

## Simple import
1. Open Torchmate (Black icon)
2. File > Import DXF 
Torchmate has a little post-processing algorithm that will turn your DXF into Gcode. It's quick and dirty. The applet will ask you for a bunch of things, but the ones that matter are:
3. Scale. This is important if the file was drawn in mm. For the coat hook, we will want to scale to .039 for this reason. 
4. Speed. We will be cutting 11 gauge steel with the fine cut hardware. Go  check the reference chart like we did last session to figure out the cut speed. You can set it now or later as a percentage.
5. Cutter compensation. This is done by selecting tools, which are numbered in the drop down. In this shop, we create arbitrary tools in Torchmate which correspond to the number of hundreds of an inch of tool diameter. For example, tool 8 has a diameter of .08 inches. We know from experiments that the 45-amp fine-cut hardware cuts a slot of .06 inches in 11 gauge mild steel, so select tool 6.   

That's all it takes.


## Making a custom toolpath with CAM

1. Open Torchmate CAD (White icon)
2. File > import > <choose your file> 
3. Machine > Create toopath > Male
4. You can mostly ignore the "Template" tab for now.
5. Move to "Basic Cut" tab and select tool "Plasma" (We are just doing this for this exercise, we will go into the nuances of tools on day 3)
6. You will want to select climbing. Sharp or rolled corners is a matter of context and taste. For now, do sharp.
7. Set "Feed rate" according to chart, or to 100 if you would rather do it as a percentage later. 
8. You can ignore "Power," "Assist," and "Dwell time."
7. We are going to make the same style lead-in for both cuts (outline and screw-hole), so let's design the lead in for the hole. You will want an arc lead in and lead out of 0.03 inches. You will want to select "Adjust start point" and select "Middle of longest segment." 
.

### Now do that again, but lets run the hole at 60% speed 

1. File > New
2. File > import <find cothook.svg on desktop>  
3. Select all then
4. Arrange > break path 
> Now each line can be controlled separately. In this case, the screw hole in the coat hook can be cut with a different speed and kerf compensation.
5. Select the outline of the coathook and make a toolpath like you did before, but this time lets make a lead in of a line at 45 degrees and .125 inches long. Select "Choose starting location" and set either to "Middle of longest segment" or choose a custom location using the selection grid. In this case, you want to avoid putting the start point at the tip of the coat hook where it can snag clothes. 
6. Select the screw hole and make a toolpath like you did before, but this time: select "female toolpath," set cut speed to 60% of the cut speed for the outside cut. Create a circular lead in and lead out like you did before. 
7. The cut order will probably be wrong now, and we will have to change it. To do this, go to View > Show Tool Path Viewer and then toggle on "Show order."  
8. Double click one of the numbers and set the order so that it cuts the inside screw hole before it cuts the outline. Otherwise it will cut the outline and then blow a bunch of water everywhere where it thinks the hole should be. 

9. Select everything then navigate to Machine > Output. This will bring up output vie. 

10: Click "Cut Now" and save the Gcode. (This will only work at a computer with the license dongle.) 

