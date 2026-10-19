            Analog Devices, Inc. CrossCore(R) Embedded Studio Application Example

Project Name: GpioPushbuttonLed

Description: Use the GPIO service to Toggle LED's when the push buttons are pressed
             on the BF537 EZ-KIT Lite.


    
Processor:
=============
    ADSP-BF537


Tested with:
====================
    ADSP-BF537 EZ-KIT Lite
    Analog Devices CrossCore Embedded Studio
    ADZS-HPUSB-ICE


Overview:
=========
    This example uses the GPIO service to configure the push buttons (GPIO input)
    and LED's (GPIO output) on the BF537 EZ-KIT Lite.  An interrupt is triggered by
    the push buttons which executes a callback to toggle the LED's.


User Configuration Macros:
==========================
    None


Hardware Setup:
===============
 BF537 EZ-KIT Lite Switches:
    SW5 - 1 ON
	SW5 - 2 ON

	
	
External connections:
=====================
    None

            
References:
===========
    ADSP-BF537 Hardware Reference Manual
    ADSP-BF537 EZ-KIT Lite Schematic
