#!/usr/bin/env bash

# Parse all JSON fields in a single jq call for efficiency
read_json() {
    jq -r '[
        .cwd,
        (.model.display_name // .model.id),
        (.cost.total_cost_usd // 0),
        (.cost.total_duration_ms // 0),
        (.cost.total_api_duration_ms // 0),
        (.cost.total_lines_added // 0),
        (.cost.total_lines_removed // 0),
        (.exceeds_200k_tokens // false)
    ] | @tsv'
}

# Format milliseconds to human readable duration
format_duration() {
    local ms=$1
    local total_sec=$((ms / 1000))
    local min=$((total_sec / 60))
    local sec=$((total_sec % 60))
    if [[ $min -gt 0 ]]; then
        echo "${min}m${sec}s"
    else
        echo "${sec}s"
    fi
}

# Colors
blue="\033[34m"
gray="\033[38;5;240m"
cyan="\033[36m"
yellow="\033[33m"
orange="\033[1;38;5;208m"
green="\033[32m"
red="\033[31m"
reset="\033[0m"

# Read and parse JSON input once
IFS=$'\t' read -r cwd model_name total_cost total_duration_ms api_duration_ms lines_added lines_removed exceeds_200k < <(read_json)

# Format values
display_path="${cwd/#$HOME/~}"
cost_display=$(awk "BEGIN {printf \"\$%.2f\", $total_cost}")
duration_display=$(format_duration "$total_duration_ms")
api_display=$(format_duration "$api_duration_ms")

# Build status line
line1="${blue}${display_path}${reset}"

line2="${orange}${model_name}${reset}"
line2+=" ${gray}|${reset} ${yellow}${cost_display}${reset}"
line2+=" ${gray}|${reset} ${cyan}${duration_display}${reset} ${gray}(${api_display} API)${reset}"
line2+=" ${gray}|${reset} ${green}+${lines_added}${reset}${gray}/${reset}${red}-${lines_removed}${reset}"

# Add 200K token warning if needed
if [[ "$exceeds_200k" == "true" ]]; then
    line2+=" ${red}[200K+]${reset}"
fi

printf "%b\n%b" "$line1" "$line2"
