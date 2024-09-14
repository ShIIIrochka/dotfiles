#!/usr/bin/env sh

# shellcheck disable=SC2016

export LANG='POSIX'
exec >/dev/null 2>&1
. "${HOME}/.joyfuld"

apply_wallpaper(){
    rm -rf ~/.cache/betterlockscreen/*
    feh --bg-scale "$1" && killall feh &
    sed -i '/feh/d' ${CONFIG_FILE}
    sed -i '/betterlockscreen/d' ${CONFIG_FILE}
    echo "exec --no-startup-id feh --bg-scale "$1"" >> ${CONFIG_FILE}
    betterlockscreen -u "$1" -w
    echo "bindsym Mod4+Shift+x exec betterlockscreen -l blur" >> ${CONFIG_FILE}
}

case "${1}" in
    '') WALLPAPER="$(for LS in "$CHK_WALLPAPER_DIR"/*.*; do
                         [ ! -f "$LS" ] || echo "${LS##*/}"
                     done \
                     | rofi -theme-str '@import "wallpapers/style-1.rasi"' \
                            -no-show-icons \
                            -no-lazy-grab \
                            -no-plugins \
                            -dmenu \
                            -mesg 'Select X Wallpaper')"

        [ -n "$WALLPAPER" ] || exit ${?}

        apply_wallpaper "${CHK_WALLPAPER_DIR}${WALLPAPER}"

        dunstify "<span size='small'><u>${WALLPAPER}</u></span>\nSuccessfully applied!" \
                 -h string:synchronous:wallpaper-set \
                 -u low
    exit 0
    ;;
    g*) [ -x "$(command -v magick)" ] || exec dunstify 'Install `imagemagick`!' -h string:synchronous:install-deps \
                                                                                -a joyful_desktop \
                                                                                -u low

        cd -- "$WALLPAPER_DIR" || exit ${?}

        for RAW in *.*; do

            if [ -f "$RAW" ] && GET_WP_SIZE="$(identify -format %w "$RAW")" && [ -n "$GET_WP_SIZE" ]; then

                dunstify '' "Generating X wallpaper ..\n<span size='small'><u>${RAW}</u></span>" \
                         -h string:synchronous:wallpaper-set \
                         -t 1000

                if [ "$GET_WP_SIZE" -lt 1920 ]; then
                    RES='_HD'
                elif [ "$GET_WP_SIZE" -lt 2048 ]; then
                    RES='_FHD'
                elif [ "$GET_WP_SIZE" -lt 2880 ]; then
                    RES='_2K'
                elif [ "$GET_WP_SIZE" -lt 3840 ]; then
                    RES='_3K'
                elif [ "$GET_WP_SIZE" -lt 5120 ]; then
                    RES='_4K'
                elif [ "$GET_WP_SIZE" -lt 6144 ]; then
                    RES='_5K'
                elif [ "$GET_WP_SIZE" -lt 7168 ]; then
                    RES='_6K'
                elif [ "$GET_WP_SIZE" -lt 7680 ]; then
                    RES='_7K'
                elif [ "$GET_WP_SIZE" -eq 7680 ]; then
                    RES='_8K'
                else
                    RES='_ULTRA'
                fi

                case "$THEME" in
                    default) magick "$RAW" \
                                  -gravity center \
                                  -crop 16:9 \
                              '(' -clone 0 \
                                  -fill '#4c566a' \
                                  -colorize 50% \
                              ')' -gravity center \
                                  -compose lighten \
                                  -composite \
                              '(' -clone 0 \
                                  -fill '#4c566a' \
                                  -colorize 20% \
                              ')' -gravity center \
                                  -compose darken \
                                  -composite \
                                  -quality 100 \
                           "${CHK_WALLPAPER_DIR}/${RAW%.*}${RES}.jpg" \
                           || continue
                    ;;
                    eyec*) magick "$RAW" \
                                  -gravity center \
                                  -crop 16:9 \
                              '(' -clone 0 \
                                  -fill white \
                                  -colorize 20% \
                                  -modulate 100,127,97 \
                              ')' -fill black \
                                  -colorize 2.2% \
                                  -gravity center \
                                  -compose lighten \
                                  -composite \
                                  -quality 100 \
                           "${CHK_WALLPAPER_DIR}/${RAW%.*}${RES}.jpg" \
                           || continue
                    ;;
                esac

                dunstify '' "Successfully generated!\n<span size='small'>Now it's time to change X wallpaper</span>" \
                         -h string:synchronous:wallpaper-set \
                         -a joyful_desktop \
                         -u low

            elif [ -d "$RAW" ]; then

                continue

            else

                dunstify '' "Nothing to generate!\n<span size='small'>Puts in <u>~/${WALLPAPER_DIR##*/}</u></span>" \
                         -h string:synchronous:wallpaper-set \
                         -u low

            fi

        done
    ;;
esac

exit ${?}
