#!/bin/bash
## ---------------------------------------------------------
## ScreenShare Mac Setup Scripts                           
## May 2022 - Peter Strauss (peter@straussfamily.co.uk)    
## Pre Reqs:
##      - x86_64 Mac (Process easily extendible to ARM if suits requirments)
##      - Admin Privaliges (sudo) to install packages
##      - Curl Installed (Ships with MacOS so should be fine)
##      - Does NOT require XCode Developer CLI Tools
## ---------------------------------------------------------

#Download a package using curl. 
#1st Parameter download link; 2nd output (assumed absolute path)
function download (){
    curl -o $2 $1
}
# Install package. 
# Requires sudo access and installs to / (i.e. all users)
function install (){
    sudo installer -pkg $1 -target /
}

# Define Download Links (Preference to use link for latest packages where possible)
chromeLink=""
chromeOutput="chrome.pkg"

generalZoom="https://zoom.us/client/latest/Zoom.pkg"
zoomDownloadLink="https://cdn.zoom.us/prod/5.9.6.4993/Zoom.pkg"
zoomOutput="zoom.pkg"

malwareLink="https://data-cdn.mbamupdates.com/web/mb4_mac/Malwarebytes-Mac-4.14.26.4565.pkg"
malwareOutput="malwarebytes.pkg"

sohposLink="https://s.home.sophos.com/download/SophosInstall.zip"
sohposOutput="sophos.zip"

# Move Terminal Session to Downloads Folder 
cd ~/Downloads

# Download and install Google Chrome
# download $chromeLink $chromeOutput
# install $chromeOutput

# Download and install Zoom
download $zoomDownloadLink $zoomOutput
install $zoomOutput

# Download and install Malwarebytes
download $malwareLink $malwareOutput
install $malwareOutput

download $sohposLink $sohposOutput




## Future dev stuff - ignore 

# Vars for future expansion
# zoomARM=https://zoom.us/client/latest/Zoom.pkg?archType=arm64
# uname=$(uname -m)

## Trying to get current version from location: headers file
# specificZoom=$(curl -I $zoom | grep location: )
# specificZoom=${specificZoom#*:} 
# specificZoom= ${echo $specificZoom | xargs}
# specificZoom=$(curl -I $zoom | grep location: | cut -d':' -f2- |cut -d' ' -f2- ) 

## malware link https://downloads.malwarebytes.com/file/mb-mac
## curl -i https://downloads.malwarebytes.com/file/mb-mac | grep "href" |cut -d'"' -f2 

# Just in case it's needed; if you want to installer a .pkg without root access:
# installer -pkg myapp.pkg -target CurrentUserHomeDirectory

