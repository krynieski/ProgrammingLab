#!/bin/bash
# --- COLORING LOG ---
# krystian.potyralski@tieto.com 2016

# Filter for warnings (set word that you want to filter warnings with,
# e.g. orion to see only warnings from orion. Leave empty to color all
# warnings):
wrn_filter=""

# Will color whole lines with strings (case insensitive):
# RED:
# - error:
# - undefined reference
# - no such file
# - failed
red="\(^.*error:.*$\)\|\(^.*undefined reference.*$\)\|\(^.*no such file.*$\)\|\(^.*failed.*$\)"
# YELLOW:
# - warning:
yellow="\(^.*$wrn_filter.*warning:.*$\)"
# UNDERLINE:
# - Making
underline="\(^Making.*\)"

esc=$(printf '\033')
#define "substitute" with coloring:
errors="s/\($red\)/${esc}[1;31m\1${esc}[m/i"
warnings="s/\($yellow\)/${esc}[1;33m\1${esc}[m/i"
other="s/\($underline\)/${esc}[4m\1${esc}[m/"
#make with color log:
./make_package_all.sh --simulator=no --device=finaxdp --bonding=no --melt=no --package=no --docu=no --enable_dti_support=no --buildroot=no 2>&1 | sed -e "$errors ; $warnings ; $other"
