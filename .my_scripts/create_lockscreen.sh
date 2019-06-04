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
	check_bin "xrandr" "xorg-xrandr"
	check_bin "convert" "imagemagick"
	check_bin "grep" "grep"
}

update() {
	orig_wall="$1"
	resized="/tmp/wallpaper.png"
	dim="/tmp/dim_user_image.png"
	dimblur="/tmp/dimblur_user_image.png"

	l_dimblur="/tmp/lockscreen.png"

	rectangles=" "
	SR=$(DISPLAY=:0 xrandr --query | grep ' connected' | grep -o '[0-9][0-9]*x[0-9][0-9]*[^ ]*')
	for RES in $SR; do
		SRA=(${RES//[x+]/ })
		CX=$((${SRA[2]} + 25))
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
		"$dimblur"

	# lockscreen backgrounds
	convert "$dimblur" -draw "fill rgba(0, 0, 0, 0.4) $rectangles" "$l_dimblur"
	rm $dim $dimblur

	echo 'All required changes have been applied!'
	echo 'You can find pictures on /tmp folder'
}

check_bins

res=$(DISPLAY=:0 xrandr --query | grep ' connected' | grep -o '[0-9][0-9]*x[0-9][0-9]*')
echo "Your resolution: $res"

update $1
