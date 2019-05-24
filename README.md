# Email-to-TaskWarrior
Make an email in Mail.app a task with TaskWarrior and Taskopen using Applescript.

The selected message in Mail becomes a Task in Taskwarrior with as it's annotation the link to the specific message. The script asks the user when you want to set the due date for the message. With taskopen you can then open the email message directly by invoking the taskopen command. 

# Dependencies
- You need [TaskWarrior](https://taskwarrior.org/)
- In order to open the link to the message you require [Taskopen](https://github.com/ValiValpas/taskopen). You can use [my fork](https://github.com/ABeehive/taskopen), or make sure to add 'message' to the links that the browser opens. You can do this by making sure it reads : $BROWSER_REGEX = "www|http|message"; 
- I use [Mail Act-On](https://smallcubed.com/scs/) but this isn't required. But you need something to invoke the specific AppleScript. For example, via an Inbox Rule.

# Install 
- Check what you want to specific task to become.
- Add the script to ~/Library/Application\ Scripts/com.apple.mail 
- Install taskopen

That's it. Invoke the applescript by using Inbox Rules or a Mail Act-On rule. 


# Known issues:
- If the subject includes a ( or ) then it fails. Working on a solution.
