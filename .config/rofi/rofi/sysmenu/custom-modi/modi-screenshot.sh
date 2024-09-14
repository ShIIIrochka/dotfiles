#!/usr/bin/env sh

# shellcheck disable=SC3044

export LANG='POSIX'
exec 2>/dev/null
. "${HOME}/.joyfuld"

case "$ROFI_RETV" in
    28) LANG="$SYSTEM_LANG" exec "${0%/*}/../launchers/type-1/launcher.sh"
    ;;
esac

ROW_ICON_FONT='feather 15'
MSG_ICON_FONT='feather 60'

A_='' A="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${A_}</span>   Screen"
B_='' B="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${B_}</span>   Select or Draw"
C_='' C="<span font_desc='${ROW_ICON_FONT}' weight='bold'>${C_}</span>   Countdown ${SS_COUNTDOWN_SECONDS:-5}s"

# https://gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#:~:text=expand_aliases
[ -z "$BASH" ] || shopt -s expand_aliases

case "${@}" in
    "$A") joyd_screenshot_screen
          return ${?}
    ;;
    "$B") joyd_screenshot_selection
          return ${?}
    ;;
    "$C") joyd_screenshot_countdown
          return ${?}
    ;;
esac

MESSAGE="<span font_desc='${MSG_ICON_FONT}' weight='medium'></span>"

printf '%b\n' '\0use-hot-keys\037true' '\0markup-rows\037true' "\0message\037${MESSAGE}" \
              "$A" "$B" "$C"

exit ${?}
