xmlstarlet ed -P -S -L -N bop="www.alphora.com/schemas/bop" -s /_:instanceconfiguration/_:serverconfiguration -t elem -n setting -v "" \
-i //setting -t attr -n "xmlns" -v "Alphora.Dataphor.DAE.Schema,Alphora.Dataphor.DAE" \
-i //setting -t attr -n "devicename" -v "TILTidDevice" \
-i //setting -t attr -n "settingname" -v $1 \
-i //setting -t attr -n "settingvalue" -v $2 \
-r //setting -v devicesettings.devicesetting \
/usr/share/Alphora/Dataphor/Instances/ServerConfigurations.config 2> /dev/null