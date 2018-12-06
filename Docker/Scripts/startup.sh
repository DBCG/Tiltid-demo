#!/usr/bin/env bash

echo "Adding device settings"
./add_device_setting.sh "Server" $SERVER
./add_device_setting.sh  "Port" $PORT
./add_device_setting.sh  "Database" $DATABASE
./add_device_setting.sh "UserID" $USERID
# ./adddevicesetting "Password" $PASSWORD
./add_device_setting.sh  "ReconcileMode" $RECONCILEMODE
./add_device_setting.sh  "ReconcileMaster" $RECONCILEMASTER

echo "Server configuration"
xmlstarlet sel -N bop="www.alphora.com/schemas/bop" -t -c /_:instanceconfiguration/_:serverconfiguration /usr/share/Alphora/Dataphor/Instances/ServerConfigurations.config 2> /dev/null


echo "Setting Current Library"
dotnet /usr/share/Alphora/D4Runner/D4Runner.dll /A:Processor "SetLibrary('TILTidMain');"

echo "Generating Reconciliation Script"
dotnet /usr/share/Alphora/D4Runner/D4Runner.dll /A:Processor "SQLExecute('TILTidDevice', DeviceReconciliationScript('TILTidDevice'));"


echo "Starting API"
dotnet Dataphoria.Web.API.dll