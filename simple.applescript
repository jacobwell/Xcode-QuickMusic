on awake from nib theObject --> Connect to "artwork" image view
	if name of theObject is "thewell" then
		set imageView to theObject
	end if
end awake from nib

on clicked theObject
	beep
	if name of theObject is "thewell" then
		set imageView to theObject
	end if
	using terms from application "iTunes"
		tell application "iTunes"
			if exists (database ID of current track) then
				set cur_song to (name of the current track as string)
				set cur_artist to (artist of the current track as string)
				set cur_album to (album of the current track as string)
				
				if (count artwork of current track) > 0 then
					set cur_art to data of artwork 1 of the current track as picture
				else
					set cur_art to missing value
				end if
			else
				set cur_song to "No song"
				set cur_artist to "currently"
				set cur_album to "playing"
				set cur_art to missing value
			end if
		end tell
	end using terms from
	call method "displayArtworkInImageView:trackHasArtwork:" of class "ArtworkController" with parameters {imageView, (cur_art is not missing value)}
end clicked
