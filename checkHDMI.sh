#!/bin/bash                                                                                                                                                                                                                                                    

if [ `xrandr | grep HDMI1 | grep -c ' connected '` -eq 1 ]; then
        xrandr --newmode "1440x1080_60.00"  129.87  1440 1536 1688 1936  1080 1081 1084 1118  -HSync +Vsync ;
	xrandr --addmode HDMI1 "1440x1080_60.00" ; 
	xrandr --auto --output HDMI1 --mode 1440x1080_60.00 --left-of eDP1 ;
fi
if [ `xrandr | grep HDMI1 | grep -c ' disconnected '` -eq 1 ]; then
		xrandr --auto --output eDP1 ;
fi