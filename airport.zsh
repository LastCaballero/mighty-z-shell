#! /usr/bin/zsh

typeset -A attacks=()

function insert () {
	
	local port=$1
	print "attack at $port"

	(( attacks[$port]++ ))
	
	for at ( ${(k)attacks} ) {
		print -c $at $attacks[$at]
	}

}

start_listener () {
	
	local port=$1
	
	while ( true ) {
		netcat -l 	$port
		insert 		$port
	} &

}


start_listener 4000


