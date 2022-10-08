#!/bin/bash

# \033[1A move cursor up a line
# \033[K  delete til end of line
# If you only have one line, \r will move cursor to start of line and allow overwrite

frame_one=(
"   ^~^  , " 
"  ('x') ) " 
"  /   \(  " 
" (\|||/)) " 
)


frame_two=(
"   ^~^  , " 
"  ('x')(  " 
"  /   \ ) " 
" (\|||/)  " 
)

frame_three=(
"   ^~^ 喵~" 
"  ('x')(  " 
"  /   \ ) " 
" (\|||/)  " 
)

line_num=${#frame_one[@]}

reset_cursor() {
	for _ in $(seq 1 $line_num); do
		printf "\033[1A"
		printf "\033[K"
	done
}

iter=0
surprise_iter=7
while true; do 
	for i in ${!frame_one[@]}; do
		printf "${frame_one[$i]}"
		printf "\n"
	done
	sleep 1

	# move cursor back 
	reset_cursor

	for i in ${!frame_two[@]}; do
		printf "${frame_two[$i]}"
		printf "\n"
	done
	sleep 1

	# move cursor back 
	reset_cursor

	if [ $iter != "0" ] && [ $(expr $iter % $surprise_iter) == "0" ]; then
		for i in ${!frame_three[@]}; do
		 printf "${frame_three[$i]}"
		 printf "\n"
		done
		sleep 1

		# move cursor back 
		reset_cursor
	fi 
	iter=$((iter+1))
done
