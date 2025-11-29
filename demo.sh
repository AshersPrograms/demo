#!/usr/bin/bash
# Title: The is a demo of a Yad boiler plate.
# Author: Gregory Wienands
# _____/\\\\\\\\\________/\\\\\\\\\\\____/\\\________/\\\__/\\\\\\\\\\\\\\\____/\\\\\\\\\_____        
#  ___/\\\\\\\\\\\\\____/\\\/////////\\\_\/\\\_______\/\\\_\/\\\///////////___/\\\///////\\\___       
#   __/\\\/////////\\\__\//\\\______\///__\/\\\_______\/\\\_\/\\\_____________\/\\\_____\/\\\___      
#    _\/\\\_______\/\\\___\////\\\_________\/\\\\\\\\\\\\\\\_\/\\\\\\\\\\\_____\/\\\\\\\\\\\/____     
#     _\/\\\\\\\\\\\\\\\______\////\\\______\/\\\/////////\\\_\/\\\///////______\/\\\//////\\\____    
#      _\/\\\/////////\\\_________\////\\\___\/\\\_______\/\\\_\/\\\_____________\/\\\____\//\\\___   
#       _\/\\\_______\/\\\__/\\\______\//\\\__\/\\\_______\/\\\_\/\\\_____________\/\\\_____\//\\\__  
#        _\/\\\_______\/\\\_\///\\\\\\\\\\\/___\/\\\_______\/\\\_\/\\\\\\\\\\\\\\\_\/\\\______\//\\\_ 
#         _\///________\///____\///////////_____\///________\///__\///////////////__\///________\///__2025
# Additional Authors: 
# Additional Authors: 
# Filename: demo.sh
# Description: This is a boiler plate for Yad and BASH scripting
# Additional_Notes: 
# Version: 25.11
VERSION="25.11"
YEAR=$(date -u +%Y)
# Date: 11-28-2025
# Last_Modified: 11-28-2025
# Last_Modified: 
# Source: https://github.com/AshersPrograms/demo/blob/main/demo.sh
# Additional_Sources: 
# License: GPL V3
# Additional_Licenses: 
# Credits: 
# Additional Credits: 
# Additional Credits: 
# Audio_Location: 
# Location_of_the_Video: 
# Embed_YouTube: 
# Website_For_Video: 
# Start_Time: 
# Parent_File: 
# Sibling_File: 
# Sibling_File: 
# Child_File: 
# Child_File: 
# Linkable: 1
# Display_Links: 1
# Display_Code: 1
# Visible: 1
# Article: 

# compile options: 
### shellcheck --exclude=SC2016 basicDocument_yad.sh

# Start Your Script Here
DEBUG=0 # turns debugging off
# DEBUG=1 # turns debugging on

Creator="Your Name"
CompanyName="yourcompanyname"
CompanyNameProper="Your Company Name"
ProgramsName="demo.sh"
ProgramsNameProper="Your Demos Name"
ProgramsNameShort="demo"
 
URL_LINK="https://www.$CompanyName.com"

IconLocation="$HOME/Thunar-Background_125x125.png"
IconWarningLocation="/usr/share/${CompanyName}/${ProgramsNameShort}/img/${ProgramsNameShort}_warning.png"
IconErrorLocation="/usr/share/${CompanyName}/${ProgramsNameShort}/img/${ProgramsNameShort}_error.png"
ImageSplash="$HOME/Thunar-Background.png"

Application_Splash="/usr/bin/asplash" # this application, asplash, is not necessary for the application to run.
# This is a program that is a Buttonless, Borderless dialog box that displays images to the screen.
Application_Yad="/usr/bin/yad"

Program_Awk="/usr/bin/awk"
Program_Cat="/usr/bin/cat"
Program_Grep="/usr/bin/grep"
Program_Sleep="/usr/bin/sleep"
Program_Wmctrl="/usr/bin/wmctrl"
STARS="***************************************************"

SHOW_ABOUT=0        # Display About CLI
SHOW_EXAMPLES=0     # Display Examples CLI
SHOW_HELP=0         # Display Help CLI
SHOW_LICENSE=0      # Display License CLI
SHOW_VERSION=0      # Display Version CLI
ERRORS=0            # If there is an error in the CLI section

# If you are runnning a SSD or better.
SSD_DRIVE="TRUE"

SPLASH_SLEEP=2 # Time to pause for the splash screen if hard drive is fast
SPLASH_SLEEP_NON_SSD=10 # Time to pause for the splash screen if slow hard drive is being used
SPLASH_WAIT=1 # Wait for splash to finish 1=yes 0=no 

function DesktopMain(){
    [ "$DEBUG" -eq 1 ] && printf "function DesktopMain line: %i\n" "$LINENO"
    # Display_Splash &
    local results
    local yad_results
    local Menu
    local CheckBox1
    local CheckBox2
    local DesktopMainTextOutput
    local PreSetQuery
    local DesktopOutput
    PreSetQuery="Presetting Query"
    CheckBox1="TRUE"
    CheckBox2="FALSE"
    Menu="Choice 1!Choice 2!Choice 3"
    DesktopMainTextOutput="This is the main section of the dialog box"
    # $Program_Sleep "$SPLASH_SLEEP"
    yad_results=$($Application_Yad \
        --form \
        --window-icon="$IconLocation" \
        --title "$ProgramsNameProper by $CompanyNameProper" \
        --height="300" \
        --width="600" \
        --center \
        --image="$IconLocation" \
        --text="$DesktopMainTextOutput"\
        --field="Query box empty:" ""\
        --field="Prefilled query box:" "$PreSetQuery" \
        --field="PullDownMenu:CB" "${Menu}" \
        --field="CheckBox 1:CHK" "$CheckBox1" \
        --field="CheckBox 2:CHK" "$CheckBox2" \
        --button="Examples:5" \
        --button="License:4" \
        --button="Help!gtk-help:3" \
        --button="About!gtk-about:2" \
        --button="Cancel!gtk-cancel:1" \
        --button="Quit!gtk-quit:252" \
        --button="Save!gtk-save:0")
    results=$?
    case $results in
        0) # Save
            [ "$DEBUG" -eq 1 ] && printf "%b\n" "comment yad_results: $yad_results line: $LINENO"
            # IFS='|' read -r var1 var2  <<< "$yad_results"
            # or add to array and extract
            IFS='|' read -r -a yadArr  <<< "$yad_results"
            ArraysEndNumber=$(printf "%i - 1\n" "${#yadArr[@]}" | bc)
            [ "$DEBUG" -eq 1 ] && printf "%b\n" "ArraysEndNumber: $ArraysEndNumber line: $LINENO"
            for i in $(seq 0 "$ArraysEndNumber"); do
                [ "$DEBUG" -eq 1 ] && printf "%b\n" "element $i: ${yadArr[$i]}"
                DesktopOutput+=$(printf "%b" "
element $i: ${yadArr[$i]}
")
            done
            DesktopNotifications "Notification" "$DesktopOutput"
            [ "$DEBUG" -eq 1 ] && printf "returning to DesktopMain line: %i\n" "$LINENO"
            DesktopMain
            ;;
        1) # Cancel
            main
            ;;
        2) # About
            DesktopNotifications "About"
            DesktopMain
            ;;
        3) # Help
            DesktopNotifications "Help"
            DesktopMain
            ;;
        4) # License.
            DesktopNotifications "License"
            DesktopMain
            ;;
        5) # Examples.
            DesktopNotifications "Examples"
            DesktopMain
            ;;
        252) # Exit from the top right X
            [ "$DEBUG" -eq 1 ] && printf "application is exiting line: %i\n" "$LINENO"
            exit 0;;
        *)
            [ "$DEBUG" -eq 1 ] && printf "out of bounds line: %i\n" "$LINENO"
            DesktopNotifications "Error" "Can to an unexpected error."
            ;;
    esac
}

function DesktopNotifications(){
    [ "$DEBUG" -eq 1 ] && printf "function DesktopNotifications line: %i\n" "$LINENO"
    ###########################################################################
    # About
    # Help
    # License
    # Examples
    # Error
    # Notification
    # Warning
    # eg.
    # DesktopNotifications "About"
    # DesktopNotifications "Help"
    # DesktopNotifications "License"
    # DesktopNotifications "Examples"
    # 
    # DesktopNotifications "Error" "This is your error message program will exit with exit code 1"
    # DesktopNotifications "Notification" "This is a notification to the User. program continues"
    # DesktopNotifications "Warning" "This is your warning program continues"
    ###########################################################################
    local Section
    local Message
    local output
    local outputIcon
    local outputTitle
    local ErrorExit
    local STARS
    Section="$1"
    Message="$2"
    
    ### internal do not change
    ErrorExit=0
    ### END OF internal do not change
    if [ "$Section" == "About" ]; then
###################### ABOUT ##################################################
        outputTitle="$ProgramsNameProper About: by $CompanyNameProper "
        outputIcon="$IconLocation"
        output=$(Help "About")
        output+="
        "
        output+=$(Help "$ProgramsNameProper License: by $CompanyNameProper ")
        output+="
        "
    elif [ "$Section" == "Examples" ]; then
###################### EXAMPLES ###############################################
        outputTitle="$ProgramsNameProper Examples: by $CompanyNameProper "
        outputIcon="$IconLocation"
        output=$(Help "Examples")
        output+="
        "
    elif [ "$Section" == "License" ]; then
###################### LICENSE ################################################
        outputTitle="$ProgramsNameProper :License by $CompanyNameProper"
        outputIcon="$IconLocation"
        output=$(Help "License")
        output+="
        "
    elif [ "$Section" == "Help" ]; then # Default "Help"
###################### HELP ###################################################
        outputTitle="$ProgramsNameProper :Help by $CompanyNameProper"
        outputIcon="$IconLocation"
        output=$(Help "Help")
        output+="
        "
        output+=$(Help "Examples")
        output+="
        "
    elif [ "$Section" == "Error" ]; then
###################### ERROR ##################################################
        ErrorExit=1
        outputTitle="$ProgramsNameProper :Error by $CompanyNameProper"
        outputIcon="$IconErrorLocation"
        output="$STARS
$ProgramsNameProper $VERSION
$STARS
    FATAL ERROR     FATAL ERROR
$STARS
There was an Error in the set up. Please fix the error to continue.
The error is:

${Message}

$ProgramsNameProper is now exiting. Until the issue can be fixed"
        
    elif [ "$Section" == "Warning" ]; then
###################### WARNING ################################################
        outputTitle="$ProgramsNameProper :Warning by $CompanyNameProper"
        outputIcon="$IconWarningLocation"
        output="$STARS
$ProgramsNameProper $VERSION
$STARS
        WARNING WARNING WARNING
$STARS
The application is issuing a Warning.
An error occurred but not a fatal error.

${Message}

Click Close for the application to continue
"
    else # the default is just a normal notification.
###################### NOTIFICATION and ALL ###################################
        outputTitle="$ProgramsNameProper :Notification by $CompanyNameProper"
        outputIcon="$IconLocation"
        output="$STARS
            Notification
$STARS
The application has a Notification for you.

${Message}

Click close to continue."
    fi # OK done collecting information now lets display it to the screen
    
    $Application_Yad \
        --window-icon="$IconLocation" \
        --title="$outputTitle" \
        --text-info \
        --width=800 \
        --height=600 \
        --fontname="monospace 12" \
        --wrap \
        --image="$outputIcon" \
        --center \
        --button="Close!gtk-close:252" \
        --filename=<($Program_Cat <<EOF
$output
EOF
)
    if [ "$ErrorExit" -eq 1 ]; then
        [ "$DEBUG" -eq 1 ] && printf "An error has occurred and the program is exiting until the situation is fixed. Exiting 1(Error) line: %i\n" "$LINENO"
        exit 1
    fi
}

function Always_On_Top(){
    [ "$DEBUG" -eq 1 ] && printf "function Always_On_Top line: %i\n" "$LINENO"
    local ProgramOnTop
    local WindowId
    ProgramOnTop="$1"
    # Use wmctrl to list windows, grep to find your window, and cut to extract the window ID
    WindowId=$($Program_Wmctrl -l | $Program_Grep "$ProgramOnTop" | $Program_Awk '{print $1}')
    [ "$DEBUG" -eq 1 ] && printf  "WindowId: %s line: %i\n" "$WindowId" "$LINENO"
    # If the window is found, set it to be always on top 
    if [ -n "$WindowId" ]; then
        [ "$DEBUG" -eq 1 ] && printf "Window is Found line: %s\n" "$LINENO"
        $Program_Wmctrl -i -r "$WindowId" -b add,above
    else
        [ "$DEBUG" -eq 1 ] && printf "Window is NOT found line: %s\n" "$LINENO"
    fi
}

function Display_Splash(){
    [ "$DEBUG" -eq 1 ] && printf "function Display_Splash line: %i\n" "$LINENO"
    local Sleeping_Splash
    if [ "$SSD_DRIVE" == "TRUE" ] || [ "$SSD_DRIVE" == "true" ]; then
        Sleeping_Splash="$SPLASH_SLEEP"
    else
        Sleeping_Splash="$SPLASH_SLEEP_NON_SSD"
    fi
    if [ -e "$Application_Splash" ]; then
        if [ "$SPLASH_WAIT" -eq 0 ]; then
            $Application_Splash -d "$Sleeping_Splash" -f "$ImageSplash" &> /dev/null &
        else
            $Application_Splash -d "$Sleeping_Splash" -f "$ImageSplash" &> /dev/null
        fi
        $Program_Sleep 1.5 && Always_On_Top "asplash" & 
    else
        $Application_Yad --picture \
        --window-icon="$IconLocation" \
        --title="$ProgramsNameProper :Splash by $CompanyNameProper" \
        --filename="$ImageSplash" \
        --geometry="800x600+100+100" \
        --on-top \
        --no-buttons \
        --timeout="$Sleeping_Splash" \
        --center \
        &
    fi
}

function Help(){
    [ "$DEBUG" -eq 1 ] && printf "function Help line: %i\n" "$LINENO"
    local Section
    Section="$1"
    if [ "$Section" == "About" ]; then
        #######################################################################
        [ "$DEBUG" -eq 1 ] && printf "Section About line: %i\n" "$LINENO"
        printf "%b\n" "$STARS
The application $ProgramsNameProper was created by $Creator
    This application was design for the purpose of...
Version: $VERSION   
"
    elif [ "$Section" == "Examples" ]; then
        #######################################################################
        [ "$DEBUG" -eq 1 ] && printf "function Examples line: %i\n" "$LINENO"
        printf "%b\n" "$STARS
******** Created by: $CompanyNameProper **********
$STARS
************ $ProgramsNameProper ***********************
$STARS

This is the examples section of $ProgramsNameProper
Syntax: Script Template [a|D|e|h|i:|l|v]

To get examples type:
$ProgramsName -e

To get the Help section type:
$ProgramsName -h

To get the About section type:
$ProgramsName -a

To get the current Version type:
$ProgramsName -v

To get the Input type:
$ProgramsName -i \"This is the input\"


$STARS
************* About Debugging *********************
$STARS

# To get Examples to run in Debugging Mode you can 
# use either
# CLI Debug display Help section
$ProgramsName -D -h
# CLI Debug interactive mode
$ProgramsName -D -i \"This test\"
# Desktop Mode
$ProgramsName -D
$STARS
$CompanyNameProper
$ProgramsNameProper, Created by: $Creator 
$URL_LINK
$STARS"
    elif [ "$Section" == "License" ]; then
        #######################################################################
        [ "$DEBUG" -eq 1 ] && printf "Section License line: %i\n" "$LINENO"
        printf "Copyright %i %s %s\n" "$YEAR" "$Creator" "$CompanyNameProper"
        printf "%s\n" "$URL_LINK"
    elif [ "$Section" == "Version" ]; then
        #######################################################################
        [ "$DEBUG" -eq 1 ] && printf "function Version line: %i\n" "$LINENO"
        printf "%b\n" "$ProgramsNameProper Created by $Creator\nVersion: $VERSION"
    else # same as "Help"
        #######################################################################
        [ "$DEBUG" -eq 1 ] && printf "Section Help line: %i\n" "$LINENO"
        printf "%b\n" "$STARS
******** Created by: $CompanyNameProper **********
$STARS
************ $ProgramsNameProper ***********************
$STARS
Purpose: 
$ProgramsName: is a next generation application 
making it ideal for anyone looking to enhance 
their 

Description of the script functions are:
Syntax: Script Template [a|D|e|h|i:|l|v]
options:
a               Display About
D               Debug, Display Developers Information
e               Display examples of how to use this 
                   program in terminal mode
h               Display this Help Section
l               Display License
i \"<input>\"   example input
v               Display Version

$STARS
$CompanyNameProper
$ProgramsNameProper, Created by: $Creator 
$URL_LINK
$STARS"
    fi
}

function main(){
    [ "$DEBUG" -eq 1 ] && printf "function main line: %i\n" "$LINENO"
    if [ "$SHOW_ABOUT" -eq 1 ]; then
        Help "About"
        exit 0
    fi
    if [ "$SHOW_EXAMPLES" -eq 1 ]; then
        Help "Examples"
        exit 0
    fi
    if [ "$SHOW_HELP" -eq 1 ]; then
        Help "Help"
        exit 0
    fi
    if [ "$SHOW_LICENSE" -eq 1 ]; then
        Help "License"
        exit 0
    fi
    if [ "$SHOW_VERSION" -eq 1 ]; then
        Help "Version"
        exit 0
    fi
    if [ "$ERRORS" -eq 1 ]; then
        Help "Help"
        exit 1
    fi
    if [ -n "$EXAMPLE_INPUT" ]; then
        printf "EXAMPLE_INPUT was used: %s\n" "$EXAMPLE_INPUT"
    fi
    SPLASH_WAIT=1
    Display_Splash
    SPLASH_WAIT=0
    DesktopMain
}

AmountOfParams=$#
while getopts "aDehi:lv" option; do
    case $option in
    a) # About
        SHOW_ABOUT=1
        ;;
    D) # debug on
        DEBUG=1
        ;;
    e) # examples
        SHOW_EXAMPLES=1
        ;;
    h) # help
        SHOW_HELP=1
        ;;
    l) # license
        SHOW_LICENSE=1
        ;;
    i) # keycode
        EXAMPLE_INPUT="${OPTARG}"
        ;;
    v) # version
        SHOW_VERSION=1
        ;;
    :) # If expected argument omitted:
        [ "$DEBUG" -eq 1 ] && printf "Error: -%s requires an argument. line: %s\n" "${OPTARG}" "$LINENO"
        ERRORS=1
        ;;
    \?) # Invalid option
        [ "$DEBUG" -eq 1 ] && printf "Invalid Option line: %I\n" "$LINENO"
        ERRORS=1
        ;;
    esac
done 
main
# EOF
