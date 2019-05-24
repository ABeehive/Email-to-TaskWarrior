tell application "Mail"
	set selectedMessages to selection
	set theMessage to item 1 of selectedMessages
	set messageid to message id of theMessage
	set urlText to "message://" & "%3c" & messageid & "%3e"
	set EmailSubject to subject of theMessage
	set theText to EmailSubject
	-- make sure that whenever the subject line starts with an indication of a reply or forward, remove this in advance, you can change this depending on your language setting(s)
	set theText to my findAndReplaceInText(theText, "Re: ", "")
	set theText to my findAndReplaceInText(theText, "RE: ", "")
	set theText to my findAndReplaceInText(theText, "FW: ", "")
	set theText to my findAndReplaceInText(theText, "Fw: ", "")
	set DueDate to display dialog "What is the due date?" default answer "friday"
	set EmailSubjectUser to display dialog "What is the topic?" default answer theText
	set TaskName to quoted form of (text returned of EmailSubjectUser)
	
	-- I had to add the path to task because of the shell I use, perhaps you don't need to do this. Check in any case if this is also where task is located for you
	do shell script "/usr/local/bin/task add Answer email about " & TaskName & " due:" & (text returned of DueDate) 
	-- Here you can also add the project and/or tag. For example : & " project:Work +email"
	set task to the result
	-- The shell script returns : 'Created task 1.' where 1 is the task number. The next two lines of code remove the period at the end, and removes the Created bit as well. so it leaves task [number] which you can then use to annote with the link to the message. You can't combine this into a single command as it requires the task to have already been created. Again check whether the path is correct. Note that i've not included 'task' here. As it is part of the result itself.
	set laatste to rich text 1 thru -2 of task
	set taskno to rich text 9 thru -1 of laatste
	do shell script "/usr/local/bin/" & taskno & " annotate -- " & urlText
end tell


on findAndReplaceInText(theText, theSearchString, theReplacementString)
	set AppleScript's text item delimiters to theSearchString
	set theTextItems to every text item of theText
	set AppleScript's text item delimiters to theReplacementString
	set theText to theTextItems as string
	set AppleScript's text item delimiters to ""
	return theText
end findAndReplaceInText
