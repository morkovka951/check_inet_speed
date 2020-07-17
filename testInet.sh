#! /bin/bash

speedtestLog="/home/morkovka/Scripts/testInet/speedtest.log"
logOut="/home/morkovka/Scripts/testInet/ALL.log"

`speedtest-cli > $speedtestLog`


################   GET Date
date=`date`
date=`echo ${date:4}`
date=`echo ${date::-9}`

#################   GET-IP from LOG
getIP=`cat /home/morkovka/Scripts/testInet/speedtest.log | grep "Testing from" | awk {'print $5'}`
#echo $getIP
getIP=`echo ${getIP:1}`
getIP=`echo ${getIP::-4}`

################   GET Download from LOG
getDown=`cat /home/morkovka/Scripts/testInet/speedtest.log | grep Download`

###############    GET Upload from LOG
getUp=`cat /home/morkovka/Scripts/testInet/speedtest.log | grep Upload`

###############    OUT ALL Data to file
echo "$date        $getIP        $getDown    $getUp" >> $logOut
