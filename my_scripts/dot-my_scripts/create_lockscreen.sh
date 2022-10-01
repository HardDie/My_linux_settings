## Need install: imagemagick

# default blur level
blur_level=1

check_bin() {
	which $1 > /dev/null 2>/dev/null
	RES=$?
	if [[ $RES -eq 1 ]]; then
		echo "Can't find '$1' bin, try install '$2' packet"
		exit
	fi
}

check_bins() {
	check_bin "convert" "imagemagick"
	check_bin "grep" "grep"

	which "i3-msg" >/dev/null 2>/dev/null
	if [[ $? -eq 1 ]]; then
		which "swaymsg" >/dev/null 2>/dev/null
		if [[ $? -eq 1 ]]; then
			echo "Can't find i3/sway msg app"
			exit
		else
			MSG="swaymsg"
		fi
	else
		MSG="i3-msg"
	fi
}

update() {
	orig_wall="$1"
	resized="/tmp/wallpaper.png"
	dim="/tmp/dim_user_image.png"
	dimblur="/tmp/dimblur_user_image.png"

	l_dimblur="/tmp/lockscreen.png"

	rectangles=" "
	SR=$res
	for RES in $SR; do
		SRA=(${RES//[x+]/ })
		CX=25 # x(0) + 25
		CY=$((${SRA[1]} - 30))
		rectangles+="rectangle $CX,$CY $((CX+300)),$((CY-80)) "
	done

	# wallpapers
	# resize image
	convert "$orig_wall" -resize "$res""^" -gravity center -extent "$res" "$resized"
	# dim
	convert "$resized" -fill black -colorize 40% "$dim"
	# dimblur
	blur_shrink=$(echo "scale=2; 20 / $blur_level" | bc)
	blur_sigma=$(echo "scale=2; 0.6 * $blur_level" | bc)
	convert "$dim" \
		-filter Gaussian \
		-resize "$blur_shrink%" \
		-define "filter:sigma=$blur_sigma" \
		-resize "$res^" -gravity center -extent "$res" \
		"$l_dimblur"

	# lockscreen backgrounds
	rm $dim

	echo 'All required changes have been applied!'
	echo 'You can find pictures on /tmp folder'
}

# Check image path
if [[ $# -ne 1 || ! -f $1 || ! -r $1 ]]; then
	echo "ERROR: Required pictire path as argument!"
	echo "example: $0 /path/to/img.png"
	exit
fi

check_bins

res=$($MSG -t get_outputs | jq -r '.[] | select(.focused) | .rect | "\(.width)x\(.height)"')
echo "Your resolution: $res"

update $1
