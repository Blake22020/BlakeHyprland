#!/bin/bash

# Путь к конфигу
CONFFILE="${HOME}/.config/mako/config"

# Если используете pywal, берем цвета оттуда
if [ -f "${HOME}/.cache/wal/colors.sh" ]; then
    . "${HOME}/.cache/wal/colors.sh"
    BG="$background"
    FG="$foreground"
    ACCENT="$color4" # Обычно синий/голубой в pywal
else
    # Хардкод Tokyo Night, если pywal не запущен
    BG="#1a1b26"
    FG="#c0caf5"
    ACCENT="#7aa2f7"
fi

# Обновляем конфиг через sed
sed -i "s/^background-color=.*/background-color=$BG/" "$CONFFILE"
sed -i "s/^text-color=.*/text-color=$FG/" "$CONFFILE"
sed -i "s/^border-color=.*/border-color=$ACCENT/" "$CONFFILE"

# Перезагружаем mako
makoctl reload