#!/bin/bash
#
###############################################################################################################################################
#
# ABOUT THIS PROGRAM
#
#	Screen-Disconnect.sh
#	https://github.com/Headbolt/Screen-Disconnect
#
#   This Script is designed for use in JAMF and was designed to remove a ConnectWise ScreenConnect Install
#
#	The Following Variables should be defined
#	Variable 4 - Named "ScreenConnect ID eg 4794adf494393944"
#
###############################################################################################################################################
#
# HISTORY
#
#   Version: 1.0 - 01/07/2023
#
#	01/07/2023 - V1.0 - Created by Headbolt
#
###############################################################################################################################################
#
#   DEFINE VARIABLES & READ IN PARAMETERS
#
###############################################################################################################################################
#
ScreenConnectID=$4 # Grab The ScreenConnect ID from JAMF Variable #4
#
ScriptName="Application | ScreenConnect Uninstall"
ExitCode=0
#
###############################################################################################################################################
#
#   Checking and Setting Variables Complete
#
###############################################################################################################################################
# 
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
###############################################################################################################################################
#
# Defining Functions
#
###############################################################################################################################################
#
# ConfigFile Function
#
Process(){
#
/bin/echo 'Processing ConnectWise/ScreenConnect Instance "'$ScreenConnectID'"'
#
SectionEnd
/bin/echo 'Unloading Launch Daemon'
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo 'Trying Command "'launchctl unload /Library/LaunchDaemons/screenconnect-${ScreenConnectID}.plist'"'
launchctl unload /Library/LaunchDaemons/screenconnect-${ScreenConnectID}.plist
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo 'Trying Command "'launchctl unload /Library/LaunchDaemons/connectwisecontrol-${ScreenConnectID}.plist'"'
launchctl unload /Library/LaunchDaemons/screenconnect-${ScreenConnectID}.plist
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
SectionEnd
/bin/echo 'Unloading Launch Agents'
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo 'Trying Command "'launchctl unload /Library/LaunchAgents/screenconnect-${ScreenConnectID}-onlogin.plist'"'
launchctl unload /Library/LaunchAgents/screenconnect-${ScreenConnectID}-onlogin.plist
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo 'Trying Command "'launchctl unload /Library/LaunchAgents/connectwisecontrol-${ScreenConnectID}-onlogin.plist'"'
launchctl unload /Library/LaunchAgents/connectwisecontrol-${ScreenConnectID}-onlogin.plist
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
SectionEnd
/bin/echo 'Deleting Launch Daemons'
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo 'Trying Command "'rm -v /Library/LaunchDaemons/screenconnect-${ScreenConnectID}.plist'"'
rm -v /Library/LaunchDaemons/screenconnect-${ScreenConnectID}.plist
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo 'Trying Command "'rm -v /Library/LaunchAgents/connectwisecontrol-${ScreenConnectID}.plist'"'
rm -v /Library/LaunchDaemons/connectwisecontrol-${ScreenConnectID}.plist
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
SectionEnd
/bin/echo 'Deleting Launch Agents'
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo 'Trying Command "'rm -v /Library/LaunchAgents/screenconnect-${ScreenConnectID}-*.plist'"'
rm -v /Library/LaunchAgents/screenconnect-${ScreenConnectID}-*.plist
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo 'Trying Command "'rm -v /Library/LaunchAgents/connectwisecontrol-${ScreenConnectID}.plist'"'
rm -v /Library/LaunchAgents/connectwisecontrol-${ScreenConnectID}.plist
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
SectionEnd
/bin/echo 'Deleting ConnectWise/ScreenConnect'
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo 'Trying Command "'rm -rv /opt/screenconnect-${ScreenConnectID}.app'"'
rm -rv /opt/screenconnect-${ScreenConnectID}.app
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo 'Trying Command "'rm -rv /opt/connectwisecontrol-${ScreenConnectID}.app'"'
rm -rv /opt/connectwisecontrol-${ScreenConnectID}.app
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo 'Trying Command "'rm -rv /Applications/connectwisecontrol-${ScreenConnectID}.app'"'
rm -rv /Applications/connectwisecontrol-${ScreenConnectID}.app
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo 'Trying Command "'rm -rv /Applications/connectwisecontrol-${ScreenConnectID}.app'"'
rm -rv /Applications/connectwisecontrol-${ScreenConnectID}.app
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
}
#
###############################################################################################################################################
#
# Section End Function
#
SectionEnd(){
#
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo  ----------------------------------------------- # Outputting a Dotted Line for Reporting Purposes
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
}
#
###############################################################################################################################################
#
# Script End Function
#
ScriptEnd(){
#
/bin/echo Ending Script '"'$ScriptName'"'
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo  ----------------------------------------------- # Outputting a Dotted Line for Reporting Purposes
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
exit $ExitCode
#
}
#
###############################################################################################################################################
#
# End Of Function Definition
#
###############################################################################################################################################
# 
# Begin Processing
#
###############################################################################################################################################
#
/bin/echo # Outputting a Blank Line for Reporting Purposes
SectionEnd
#
Process
#
SectionEnd
ScriptEnd
