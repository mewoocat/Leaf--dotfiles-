
# style_1     style_2     style_3     style_4     style_5     style_6     style_7

theme="style_4"

dir="$HOME/.config/rofi/launchers/text"
styles=($(ls -p --hide="colors.rasi" $dir/styles))
color="${styles[$(( $RANDOM % 10 ))]}"

rofi -no-lazy-grab -show drun \
-modi run,drun,window \
-theme $dir/"$theme"
