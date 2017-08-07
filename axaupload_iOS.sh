#!/bin/bash
# @author - Chaitanya Kannali - @Copyright - CA Technologies , 2016.
# Extract Crash Reports from CA MAA and desymbolicate them.
 
## The following are required for - rest apis.
echo "################################ - START - ##############################"
 
#%%%%%%%%%%%%%%% Modify below start.  %%%%%%%%%%%%%%%
USER=tadmin
COHORT=TENANT3-USERSTORE
PASS=dost@123
SERVER=http://gudma02-i199306:9080
 

APP_NAME="1ravi_aug1"
APPVERSION=1.0
PFORM=iOS

APP_NAME=`echo "$APP_NAME"|sed 's/ /%20/g'`

echo "Appplication name is: "$APP_NAME


#%%%%%%%%%%%%%%% Modify end.  %%%%%%%%%%%%%%%

echo "Working Directory : "$WORKING_DIR
 
# Authentication tokens from MAA Server.
echo
echo Using Server : $SERVER with User : $USER and cohort : $COHORT
echo
 
#TOKEN=`curl -s  -X POST -H "Authorization: Basic $cohort" -H "Accept-Language: en_US" -d "grant_type=PASSWORD&username=$USER&password=$PASS" $SERVER/ess/security/v1/token  | json tkn`
#curl  -X POST -H "Authorization: Basic $cohort" -d "grant_type=PASSWORD&username=$USER&password=$PASS" $SERVER/ess/security/v1/token
 
TOKEN=eyJ0a24iOiI5MWQwZTc1Yi0yMTEzLTQyMzMtODJkOC1iYWY3NjkxNGMzNDQiLCJhbGwiOnRydWV9
LOCAL_PATH=/Users/hirsh04/Downloads/MAAKitchenSink.app.dSYM.zip
ENC_AUTHZ=`echo \{\"tkn\":\"$TOKEN\",\"t\":\"$COHORT\"\}    | openssl enc -base64 -A`
 
#$URL_DSYM_DOWNLOAD=$SERVER/mdo/v2/master_data/app_version?app_id=$APP_ID_DECODED&platform_name=iOS
#$(curl  -x  $URL_DSYM_DOWNLOAD  -H "Authorization: Bearer $ENC_AUTHZ" )
 
 
 
 
#URL_DSYM_UPLOAD=$SERVER/mdo/v3/symbolication/RaviTest1/?platform_name=iOS

 
#curl  -F  $LOCAL_PATH $URL_DSYM_UPLOAD  -H "Authorization: Bearer $ENC_AUTHZ"

 
 
# curl -X POST --verbose -F "file=@MAAKitchenSink.app.dSYM.zip;filename=MAAKitchenSink.app.dSYM" "$SERVER/mdo/v3/symbolication/ckmobilejuly?app_version=1.0&platform=iOS" -H "Authorization:Bearer eyJ0a24iOiI0YTA5NjIxOS01N2QzLTQzZTctODcyZS0xNDdiNjhhODNmZWMiLCJhbGwiOnRydWV9"  -H "Content-Type: application/zip" -H "Content-Length:341790"


# curl -X POST --verbose -F "file=@MAAKitchenSink.app.dSYM.zip;filename=MAAKitchenSink.app.dSYM" "$SERVER/mdo/v3/symbolication/ckmobilejuly?app_version=1.0&platform=iOS" -H "Authorization:Bearer eyJ0a24iOiI0YTA5NjIxOS01N2QzLTQzZTctODcyZS0xNDdiNjhhODNmZWMiLCJhbGwiOnRydWV9"  -H "Content-Type: application/zip" -H "Content-Length:341790"



curl -X POST --verbose -F "file=@$LOCAL_PATH;filename=MAAKitchenSink1.app.dSYM" "$SERVER/mdo/v3/symbolication/$APP_NAME?app_version=$APPVERSION&platform=$PFORM" -H "Authorization:Bearer $TOKEN"



