#!/usr/bin/expect -f

set port [lindex $argv 0]

spawn telnet 127.0.0.1 $port
expect "Escape character is '^]'."
send "AUTHENTICATE\r"
expect "250 OK"
send "signal NEWNYM\r"
expect "250 OK"
send "quit\r"
