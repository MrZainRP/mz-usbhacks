## MZ-USBHACKS - a skill based USB hacking and encoding resource integrated with XP progression

_A XP progression based hacking function for usb drops in qb-core FiveM servers_
_Created by Mr_Zain#4139_

## INTRODUCTION

- A resource where the player accesses a computer system (can be changed to any boxzone or even a PED if desirable) to hack and encode USBs found in dumspters (if using mz-bins).
- Earning XP via performing succesful hacks unlocks harder hacks (which can be customised) producing better probabilities of better hack returns i.e. more rare USB outputs. 
- USB outputs can be used for other scripts, example cryptosticks + trojan_usbs. 

## DEPENDENCIES

NOTE: You should have each of the dependencies other than qb-lock and mz-skills as part of a conventional qb-core install.

**[mz-skills](https://github.com/MrZainRP/mz-skills)** - to track skill progress. All credit to Kings#4220 for the original qb-skillz now **[B1-skillz](https://github.com/Burn-One-Studios/B1-skillz)**

**[progressbar](https://github.com/qbcore-framework/progressbar)**

**[qb-target](https://github.com/qbcore-framework/qb-target)**

**[mhacking](https://github.com/qbcore-framework/mhacking)**

**[qb-lock](https://github.com/Nathan-FiveM/qb-lock)**

OPTIONAL: (Configured to work with okokNotify as well as base qb-core notifications).

## Installation Instruction

## A. MZ-SKILLS

1. Ensure that mz-skills forms part of your running scripts. 

2. Run the "skills.sql" sql file and open the database. (This will add a data table to the existing "players" database which will hold the skill value for "Scraping" as well as other jobs)

## B. QB-CORE/SHARED/ITEMS.LUA

3. Add the following items to qb-core/shared/items.lua 
 
(PLEASE NOTE: IF YOU ARE RUNNING MZ-BINS YOU DO NOT NEED TO RE-ADD THE BLANKUSB - TROJAN_USB AND CRYPTOSTICK ARE DEFAULT QB-CORE ITEMS):

```lua
	['blankusb'] 				 	= {['name'] = 'blankusb', 			  	  	['label'] = 'Blank USB', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'blankusb.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Non-descript USB, wonder if there is anything on it?'},
	['usb1'] 				 	 	= {['name'] = 'usb1', 			  	  		['label'] = 'Blue USB', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'usbblue.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'The Blank USB has downloaded a particular encryption marking it blue.'},
	['usb2'] 				 	 	= {['name'] = 'usb2', 			  	  		['label'] = 'Red USB', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'usbred.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'The Blank USB has downloaded a particular encryption marking it red.'},
	['usb3'] 				 	 	= {['name'] = 'usb3', 			  	  		['label'] = 'Pink USB', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'usbpink.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'The Blank USB has downloaded a particular encryption marking it pink.'},
	['usb4'] 				 		= {['name'] = 'usb4', 			  	  		['label'] = 'Green USB', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'usbgreen.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'The Blank USB has downloaded a particular encryption marking it green.'},
```

## C. IMAGES

4. Add the images which appear in the "images" folder to your inventory images folder. If using lj-inventory, add the images to: lj-inventory/html/images/ - if you are using qb-inventory, add the images to qb-inventory/html/images/

## D. DOORLOCK

5. If you are using the default location to allow access to the hacking room, add this to your doorlock config file:

```lua
-- usbhack_door created by Mr_Zain
Config.DoorList['usbhack_door-usbhack_door'] = {
    distance = 2,
    fixText = false,
    objCoords = vec3(-70.522263, 6254.583984, 31.233118),
    doorType = 'door',
    objName = -952356348,
    doorRate = 1.0,
    locked = true,
    objYaw = 122.89998626709,
    doorLabel = 'usbhack_door',
    autoLock = 120000,
}
```

(YOU CAN ALTERNATIVELY SIMPLY ADD THE CONFIG FILE WHICH COMES WITH THIS RESOURCE TO YOUR QB-DOORLOCK/CONFIGS FOLDER)

## F. FINALISATION

6. If you attend to all of the above steps you will need to restart the server in order for the new added items to be recognised by qb-core. Please restart your server ensuring that mz-scrap is ensured/starts after qb-core starts (ideally it should just form part of your [qb] folder).
