osascript -e \
'if application "Spotify" is running then
	tell application "Spotify"
		if (get player state as string is equal to "playing") then 
			set msg to "#[fg=colour3]  ♪ #[fg=white]" & (get artist of current track) &  " – "  & (get name of current track)
			set len to count msg
			# TODO: fix padding
			if len < 40 then
				set padcount to 40 - len
				repeat with i from 1 to padcount
					set msg to msg & " "
				end repeat
			else
			end if
			return msg
		else
			return "  #[fg=colour3]• #[fg=colour2]• #[fg=colour4]•                                 "
		end if
	end tell
else
	return "  #[fg=colour3]• #[fg=colour2]• #[fg=colour4]•                                 "
end if'

