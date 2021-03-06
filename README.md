# DualTul
Hivetul code on dual scale system
This time trying to keep all my code on the usb drive.


Some history and architecture notes.
This code is intended to be used with the Raspberry Pi and a butchered bathroom scale to produce a 'cost effective' hive weight monitoring system and data log.
Originally I started with HiveTool as presented by villagefool. 
In conversation with the author, he asked if I thought the mix of Bash & Perl was appropriate. I said, yeah, I thought so.


...But that got me thinking, can I make a pure-perl implementation? Thus came HiveTul, same name - different spelling.
At this point a couple of issues were observed:

-I wanted data stored in a more transparent format than SQL. Ditching it also reduces overhead.

-I also wanted to get rid of RRD in favor of some data presentation that had more options.

-I wanted to monitor more than one hive (reduce the per-hive cost!)

-The Pi version had moved on to B+ v2, which changed SD card configuration (hardware only).

...and the port I had used (P5) was not available on the v2.

... (but there were two extra usb ports!)

-I had experienced the SD card corruption issue that is fairly well documented for the Pi, so I wished to move as much of the data, program, and if possible, log files off to a USB stick external drive.

-I had also found the TemperHum unit cost a lot, relative to the data I collected. 
Temperature was stable and the screen that allowed humidity to be monitored was filled with propolis so there was no valid data collected!


So, thus was born DualTul.
Since two hive strain gauges are monitored, and therefore two HX711 interfaces are required; I compiled two copies of the HX711 code with the defines for each unit set as connected.
I also found that the Pi had a temperature sensor on the CPU, this isn't 'ambient', well maybe, ambient after dissipating the small amount of heat generated by a nearly idle cpu.
The data acquisition is as simple as can be. It reads the two HX711 weight values, the CPU temperature, writes this to a text file as CSV with the epoch timestamp. 
The acquisition runs when kicked off by a cron job. To replicate this you will need matching hardware.
The rest of the glitz is in the web page presentation code. This also means that the get-the-data and the present-the-data are isolated from each other.
It uses the dygraph library to create a presentation image. This code is used for a lot of data (financial & scientific, noteably Hivemind), so there are samples gallore.


Installation notes - 
clone all of this code to the external drive which you have mapped to:
/media/usbstick/www
and yes, you guessed - this will be the web page directory, too.
edit your Apache2 configuration so that that directory is the index directory.
rename the datafile sample to data0.csv.
You should be able to pull up the sample data from the address


Hardware installation:
(under construction!)


