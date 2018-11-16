#!/bin/sh

expect -c "

set timeout 10
set send_slow {1.1}

# Debug mode
#spawn cu -l /dev/ttyS2 -d

spawn cu -l /dev/ttyS2

sleep 2
send \"\r\"


expect \"Username:\"
send \"netmgr\n\"
expect \"Password:\"

send \"m2vc_kgk\n\"

expect \">\"

send \"en\n\"

expect \"Password:\"

send \"m2vc_kgk.ble\n\"

expect \"\#\"

send \"term leng 0 \n\"

expect \"\#\"

send \"show run \n\"

expect \"\#\"

send \"exit \n\"

expect \"Press RETURN to get started.\"

exit 0

"
