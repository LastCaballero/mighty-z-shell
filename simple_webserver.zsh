#! /bin/zsh
standard_header='HTTP/1.1 200 OK
Server: OwnServer
Connection: close

file received'

while ( true ) {
    print $standard_header | 
        netcat -N -l 4000 | tee -a http_log.txt
}
    

