on clicked theObject
	if name of theObject is "exit" then
		quit
	else if name of theObject is "thetoggle" then
		if content of text field "triob" of window "thewindow" is "1" then
			set state of button "thetoggle" of window "thewindow" to 1
			set content of text field "triob" of window "thewindow" to "2"
			
		else
			if content of text field "toggler" of window "thewindow" is "0" then
				set state of button "thetoggle" of window "thewindow" to 1
				set content of text field "toggler" of window "thewindow" to "1"
				tell application "Finder"
					set {disp_x1, disp_y1, disp_x2, disp_y2} to bounds of window of desktop
				end tell
				set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - 44, disp_x2 - 0, disp_y2 - 20}
				repeat with theV from 44 to 67 by 2
					set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - theV, disp_x2 - 0, disp_y2 - 20}
				end repeat
			else if content of text field "toggler" of window "thewindow" is "1" then
				set content of text field "toggler" of window "thewindow" to "0"
				set state of button "thetoggle" of window "thewindow" to 0
				
				tell application "Finder"
					set {disp_x1, disp_y1, disp_x2, disp_y2} to bounds of window of desktop
				end tell
				set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - 67, disp_x2 - 0, disp_y2 - 20}
				repeat with theX from 67 to 44 by -2
					set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - theX, disp_x2 - 0, disp_y2 - 20}
				end repeat
			end if
		end if
	else if name of theObject is "uberbutton" then
		set i to contents of control "therating" of window "thewindow"
		tell application "iTunes"
			set newrate to (i * 20)
			set rating of current track to newrate
		end tell
	else if name of theObject is "viewbtn" then
		if content of theObject is 0 then
			tell application "iTunes"
				activate
			end tell
			tell application "System Events"
				keystroke "3" using {command down, option down}
			end tell
			set the contents of text field "viewref" of window "thewindow" to "0"
			
		else if content of theObject is 1 then
			tell application "iTunes"
				activate
			end tell
			set the contents of text field "viewref" of window "thewindow" to "1"
			
			tell application "System Events"
				keystroke "4" using {command down, option down}
			end tell
		else if content of theObject is 2 then
			tell application "iTunes"
				activate
			end tell
			set the contents of text field "viewref" of window "thewindow" to "2"
			
			tell application "System Events"
				keystroke "5" using {command down, option down}
			end tell
			
		end if
	else if name of theObject is "artsearch" then
		using terms from application "iTunes"
			tell application "iTunes"
				if exists (database ID of current track) then
					set cur_artist to the artist of the current track
				else
					set cur_artist to ""
				end if
			end tell
		end using terms from
		set x to cur_artist
		set contents of text field "thesearch" of window "thewindow" to x
		if state of button "sandp" of window "thewindow" is 0 then
			tell application "System Events"
				keystroke tab
			end tell
		else
			set state of button "sandp" of window "thewindow" to 0
			tell application "System Events"
				keystroke tab
			end tell
			delay 2
			set state of button "sandp" of window "thewindow" to 1
		end if
		
	else if name of theObject is "5size" then
		tell application "iTunes"
			activate
		end tell
		tell application "System Events"
			keystroke "l" using command down
			key code 29 using {command down}
		end tell
	else if name of theObject is "1size" then
		tell application "iTunes"
			activate
		end tell
		tell application "System Events"
			keystroke "l" using command down
			key code 18 using {command down}
		end tell
	else if name of theObject is "2size" then
		tell application "iTunes"
			activate
		end tell
		tell application "System Events"
			keystroke "l" using command down
			key code 19 using {command down}
		end tell
	else if name of theObject is "fitsize" then
		tell application "iTunes"
			activate
		end tell
		tell application "System Events"
			keystroke "l" using command down
			key code 20 using {command down}
		end tell
	else if name of theObject is "fullsize" then
		tell application "iTunes"
			activate
		end tell
		tell application "System Events"
			keystroke "f" using command down
		end tell
	else if name of theObject is "vizbtn" then
		tell application "iTunes"
			activate
		end tell
		tell application "System Events"
			keystroke "t" using command down
		end tell
	else if name of theObject is "playbtn" then
		tell application "iTunes"
			playpause
		end tell
	else if name of theObject is "prevbtn" then
		tell application "iTunes"
			previous track
		end tell
	else if name of theObject is "nextbtn" then
		tell application "iTunes"
			next track
		end tell
	else if name of theObject is "ami" then
		tell application "System Events"
			set fapp to the name of the first process whose frontmost is true
		end tell
		set the contents of text field "appi" of window "thewindow" to fapp
		delay 1
		
	end if
	set appname to contents of text field "app1" of window "thewindow"
	tell application appname
		activate
	end tell
end clicked

on mouse exited theObject event theEvent
	if name of theObject is "thetoggle" then
		if contents of text field "area1" of window "thewindow" is "3" then
			beep
		else if contents of text field "triob" of window "thewindow" is "1" then
			set content of text field "toggler" of window "thewindow" to "0"
			set state of button "thetoggle" of window "thewindow" to 0
			
			tell application "Finder"
				set {disp_x1, disp_y1, disp_x2, disp_y2} to bounds of window of desktop
			end tell
			set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - 67, disp_x2 - 0, disp_y2 - 20}
			repeat with theX from 67 to 44 by -2
				set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - theX, disp_x2 - 0, disp_y2 - 20}
			end repeat
		end if
	else if name of theObject is "titletext" then
		using terms from application "iTunes"
			tell application "iTunes"
				if exists (database ID of current track) then
					set cur_song to the name of the current track
					set cur_artist to the artist of the current track
				else
					set cur_song to "No song info available"
					set cur_artist to "Unknown"
				end if
			end tell
		end using terms from
		tell window "thewindow"
			set the contents of text field "titleText" to cur_song
			
		end tell
	else if name of theObject is "rec1" then
		set levwasVar to contents of text field "levwas" of window "thewindow"
		set contents of the control "therating" of window "thewindow" to levwasVar
	end if
end mouse exited


on mouse entered theObject event theEvent
	if name of theObject is "thetoggle" then
		if content of text field "toggler" of window "thewindow" is "0" then
			set state of button "thetoggle" of window "thewindow" to 1
			set content of text field "toggler" of window "thewindow" to "1"
			set content of text field "triob" of window "thewindow" to "1"
			tell application "Finder"
				set {disp_x1, disp_y1, disp_x2, disp_y2} to bounds of window of desktop
			end tell
			set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - 44, disp_x2 - 0, disp_y2 - 20}
			repeat with theV from 44 to 67 by 2
				set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - theV, disp_x2 - 0, disp_y2 - 20}
			end repeat
		end if
	else if name of theObject is "titletext" then
		using terms from application "iTunes"
			tell application "iTunes"
				if exists (database ID of current track) then
					set cur_song to the name of the current track
					set cur_artist to the artist of the current track
				else
					set cur_song to "No song info available"
					set cur_artist to "Unknown"
				end if
			end tell
		end using terms from
		tell window "thewindow"
			set the contents of text field "titleText" to cur_artist
		end tell
	else if name of theObject is "sq1" then
		set contents of the control "therating" of window "thewindow" to 1
	else if name of theObject is "sq2" then
		set contents of the control "therating" of window "thewindow" to 2
	else if name of theObject is "sq3" then
		set contents of the control "therating" of window "thewindow" to 3
	else if name of theObject is "sq4" then
		set contents of the control "therating" of window "thewindow" to 4
	else if name of theObject is "sq5" then
		set contents of the control "therating" of window "thewindow" to 5
	else if name of theObject is "playbtn" then
		beep
	else if name of theObject is "nextbtn" then
		beep
	else if name of theObject is "prevbtn" then
		beep
	else if name of theObject is "exit" then
		beep
	else
		delay 1
		using terms from application "iTunes"
			tell application "iTunes"
				if exists (database ID of current track) then
					set cur_song to the name of the current track
					set cur_artist to the artist of the current track
				else
					set cur_song to "No song info available"
					set cur_artist to "Unknown"
				end if
			end tell
		end using terms from
		tell window "thewindow"
			set the contents of text field "titleText" to cur_song
		end tell
		if content of text field "toggler" of window "thewindow" is "0" then
			set state of button "thetoggle" of window "thewindow" to 1
			set content of text field "toggler" of window "thewindow" to "1"
			tell application "Finder"
				set {disp_x1, disp_y1, disp_x2, disp_y2} to bounds of window of desktop
			end tell
			set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - 44, disp_x2 - 0, disp_y2 - 20}
			repeat with theV from 44 to 67 by 2
				set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - theV, disp_x2 - 0, disp_y2 - 20}
			end repeat
			delay 1
			set content of text field "toggler" of window "thewindow" to "0"
			set state of button "thetoggle" of window "thewindow" to 0
			
			tell application "Finder"
				set {disp_x1, disp_y1, disp_x2, disp_y2} to bounds of window of desktop
			end tell
			set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - 67, disp_x2 - 0, disp_y2 - 20}
			repeat with theX from 67 to 44 by -2
				set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - theX, disp_x2 - 0, disp_y2 - 20}
			end repeat
		end if
	end if
end mouse entered

on end editing theObject
	set query to contents of text field "thesearch" of window "thewindow"
	tell application "System Events"
		if exists process "iTunes" then
			set bob to visible of process "iTunes"
		end if
	end tell
	tell application "iTunes"
		set fred to minimized of front browser window
		set col to collapsed of window "iTunes"
		set vis to visible of window "iTunes"
	end tell
	tell application "iTunes"
		activate
	end tell
	tell application "System Events"
		tell application "iTunes"
			activate
			play
		end tell
		keystroke "l" using command down
		keystroke tab
		keystroke tab
		keystroke "a"
		keystroke (ASCII character 8)
		keystroke query
		keystroke tab
		keystroke "£" using command down
	end tell
	if content of text field "viewref" of window "thewindow" is "0" then
		tell application "System Events"
			keystroke "3" using {command down, option down}
		end tell
	else if content of text field "viewref" of window "thewindow" is "1" then
		tell application "System Events"
			keystroke "4" using {command down, option down}
		end tell
	else if content of text field "viewref" of window "thewindow" is "2" then
		tell application "System Events"
			keystroke "5" using {command down, option down}
		end tell
	end if
	if state of button "sandp" of window "thewindow" is 1 then
		tell application "System Events"
			tell application "iTunes"
				stop
			end tell
			keystroke "a" using command down
			keystroke space
			tell application "System Events"
				if exists process "iTunes" then
					set visible of process "iTunes" to bob
				end if
			end tell
			tell application "iTunes"
				set visible of window "iTunes" to vis
				set minimized of front browser window to fred
				set collapsed of window "iTunes" to col
			end tell
		end tell
	end if
	using terms from application "iTunes"
		tell application "iTunes"
			if exists (database ID of current track) then
				set cur_song to the name of the current track
				set cur_artist to the artist of the current track
			else
				set cur_song to "No song info available"
				set cur_artist to "Unknown"
			end if
		end tell
	end using terms from
	tell window "thewindow"
		set the contents of text field "titleText" to cur_song
	end tell
end end editing

on mouse down theObject
	if name of theObject is "theslider" then
		if content of text field "muter" of window "thewindow" is "t" then
			set y to content of text field "volset" of window "thewindow"
			set contents of slider "theslider" of window "thewindow" to y
			set content of text field "muter" of window "thewindow" to "f"
			tell application "iTunes"
				set the sound volume to y
			end tell
		else if content of text field "muter" of window "thewindow" is "tp" then
			set content of text field "muter" of window "thewindow" to "f"
			set y to content of text field "volset" of window "thewindow"
			set content of text field "muter" of window "thewindow" to "f"
			tell application "iTunes"
				set x to sound volume
				set z to y
				set a to 1
				play
			end tell
			repeat z times
				set sound volume to (a)
				set a to a + 1
				set contents of slider "theslider" of window "thewindow" to (a - 1)
			end repeat
		end if
	end if
end mouse down

on action theslider
	using terms from application "iTunes"
		tell application "iTunes"
			if exists (database ID of current track) then
				set cur_song to the name of the current track
				set cur_artist to the artist of the current track
			else
				set cur_song to "No song info available"
				set cur_artist to "Unknown"
			end if
		end tell
	end using terms from
	tell window "thewindow"
		set the contents of text field "titleText" to cur_song
	end tell
	set y to contents of slider "theslider" of window "thewindow" as integer
	if content of text field "muter" of window "thewindow" is "tp" then
		tell application "iTunes"
			set x to sound volume
			set z to (x - y)
			if z is less than 0 then set z to (z * -1)
			set a to 0
			repeat z + 1 times
				set sound volume to (x - a)
				if x is greater than y then
					set a to a + 1
				else if y is greater than x then
					set a to a - 1
				else
					set sound volume to x
					exit repeat
				end if
			end repeat
			play
		end tell
	else if y is 0 then
		tell application "iTunes"
			set x to the sound volume
		end tell
		set content of text field "volset" of window "thewindow" to x
		set content of text field "muter" of window "thewindow" to "t"
		tell application "iTunes"
			if (player state is playing) then
				set newrandvar to 1
			end if
		end tell
		if newrandvar is 1 then set content of text field "muter" of window "thewindow" to "tp"
		tell application "iTunes"
			set x to sound volume
			set z to (x - y)
			if z is less than 0 then set z to (z * -1)
			set a to 0
			repeat z + 1 times
				set sound volume to (x - a)
				if x is greater than y then
					set a to a + 1
				else if y is greater than x then
					set a to a - 1
				else
					set sound volume to x
					exit repeat
				end if
			end repeat
			pause
		end tell
	else
		tell application "iTunes"
			set the sound volume to y
		end tell
	end if
end action


on will close thewindow
	tell application "QuickMusic"
		quit
	end tell
end will close


on launched theapp
	set prevsong to ""
	set escape to "f"
	tell application "Finder"
		set {disp_x1, disp_y1, disp_x2, disp_y2} to bounds of window of desktop
	end tell
	set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - 44, disp_x2 - 0, disp_y2 - 20}
	tell application "iTunes"
		if exists (database ID of current track) then
			set cur_song to the name of the current track
			set cur_rate to the rating of the current track
		else
			set cur_song to "No song info available"
			set cur_artist to "Unknown"
			set cur_rate to 0
		end if
		
	end tell
	tell window "thewindow"
		set the contents of text field "titleText" to cur_song
		set the contents of control "therating" to cur_rate / 20
		set contents of text field "levwas" to cur_rate / 20
	end tell
end launched

on activated theapp
	set escape to "f"
	tell application "iTunes"
		set x to the sound volume
	end tell
	set contents of slider "theslider" of window "thewindow" to x
	repeat while escape is "f"
		set prevsong to contents of text field "prevsong" of window "thewindow"
		tell application "iTunes"
			if exists (database ID of current track) then
				set cur_song to the name of the current track
				set cur_song to the name of the current track
				set cur_artist to the artist of the current track
				set cur_rate to the rating of the current track
			else
				set cur_song to "No song info available"
				set cur_artist to "Unknown"
				set cur_rate to 0
				
			end if
			
		end tell
		if (cur_song is not equal to prevsong) then
			tell window "thewindow"
				set the contents of text field "titleText" to cur_song
				set the contents of the control "therating" to cur_rate / 20
				set contents of text field "levwas" to cur_rate / 20
			end tell
			if content of text field "toggler" of window "thewindow" is "0" then
				set state of button "thetoggle" of window "thewindow" to 1
				set content of text field "toggler" of window "thewindow" to "1"
				tell application "Finder"
					set {disp_x1, disp_y1, disp_x2, disp_y2} to bounds of window of desktop
				end tell
				set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - 44, disp_x2 - 0, disp_y2 - 20}
				repeat with theV from 44 to 67 by 2
					set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - theV, disp_x2 - 0, disp_y2 - 20}
				end repeat
				tell window "thewindow"
					delay 1.5
					set the contents of text field "titleText" to cur_artist
				end tell
				delay 2
				set content of text field "toggler" of window "thewindow" to "0"
				set state of button "thetoggle" of window "thewindow" to 0
				
				tell application "Finder"
					set {disp_x1, disp_y1, disp_x2, disp_y2} to bounds of window of desktop
				end tell
				set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - 67, disp_x2 - 50, disp_y2 - 20}
				repeat with theX from 67 to 44 by -2
					set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - theX, disp_x2 - 50, disp_y2 - 20}
				end repeat
			else
				tell window "thewindow"
					delay 1.5
					set the contents of text field "titleText" to cur_artist
				end tell
			end if
			set contents of text field "prevsong" of window "thewindow" to cur_song
		else
			tell window "thewindow"
				set the contents of the control "therating" to cur_rate / 20
				set contents of text field "levwas" to cur_rate / 20
				set the contents of text field "titleText" to cur_song
				delay 2
				set the contents of text field "titleText" to cur_artist
			end tell
		end if
	end repeat
end activated

on mouse up theObject event theEvent
	set i to contents of control "therating" of window "thewindow"
	tell application "iTunes"
		set newrate to (i * 20)
		set rating of current track to newrate
	end tell
	
end mouse up


on should zoom theObject proposed bounds proposedBounds
	if content of text field "toggler" of window "thewindow" is "0" then
		set content of text field "toggler" of window "thewindow" to "1"
		tell application "Finder"
			set {disp_x1, disp_y1, disp_x2, disp_y2} to bounds of window of desktop
		end tell
		set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - 44, disp_x2 - 0, disp_y2 - 20}
		repeat with theV from 44 to 67 by 2
			set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - theV, disp_x2 - 0, disp_y2 - 20}
		end repeat
	else
		tell application "Finder"
			set {disp_x1, disp_y1, disp_x2, disp_y2} to bounds of window of desktop
		end tell
		set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - 67, disp_x2 - 0, disp_y2 - 20}
		repeat with theX from 67 to 44 by -2
			set bounds of window "thewindow" to {disp_x2 - 267, disp_y2 - theX, disp_x2 - 0, disp_y2 - 20}
		end repeat
		set the contents of text field "toggler" of window "thewindow" to "0"
	end if
end should zoom

on will become active theObject
	tell application "System Events"
		set fapp to the name of the first process whose frontmost is true
	end tell
	set the contents of text field "app1" of window "thewindow" to fapp
end will become active



