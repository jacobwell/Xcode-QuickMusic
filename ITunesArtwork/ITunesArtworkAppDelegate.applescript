--
--  ITunesArtworkAppDelegate.applescript
--  ITunesArtwork
--
--  Created by Craig Williams on 3/15/10.
--  Copyright 2010 AllanCraig. All rights reserved.
--

script iTunesArtworkAppDelegate
	property parent : class "NSObject"
	property oc_itunesArtwork : missing value
	
	on updateOCImageView_(sender)
		set imageData to my getImageDataFromiTunes()
		if not imageData = "" then
			set the clipboard to imageData
			oc_itunesArtwork's updateImage()
		else
			oc_itunesArtwork's noImage()
		end if
	end updateOCImageView_
	
	on getImageDataFromiTunes()
		tell application "iTunes"
			try
				set sel to item 1 of (get selection)
			on error
				log "No track selected"
				return ""
			end try
			
			if exists artworks of sel then
				return (get data of artwork 1 of sel)
			else
				log "Selected track has no artwork"
				return ""
			end if
		end tell
	end getImageDataFromiTunes
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script