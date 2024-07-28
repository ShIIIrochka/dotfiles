#!/bin/bash
source ~/.joyfuld

magick "$WALLPAPER_DIR/$RAW" \
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
                           "${WALLPAPER_DIR}/${RAW%.*}${RES}.jpg" \
