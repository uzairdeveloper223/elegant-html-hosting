#!/bin/bash

# Define some colors for styling the terminal output
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
RESET='\033[0m'

# Clear the screen
clear

# Function to display the help menu and exit
function show_help() {
    echo -e "${RED}###########################################${RESET}"
    echo -e "${CYAN}To stop a port running on localhost, use:${RESET}"
    echo -e "${GREEN}./localhost-stop.sh \${port} ${CYAN}Or${RESET}"
    echo -e "${GREEN}bash localhost-stop.sh \${port}${RESET}"
    echo -e "${CYAN}Thanks for using this! Try other codes too.${RESET}"
    echo -e "${RED}By UZAIRxDEV${RESET}"
    echo -e "${RED}###########################################${RESET}"
    exit 0
}

# Check if the user provided a port number
if [ -z "$1" ]; then
    show_help
fi

# Get the port number from the first argument
port_number=$1

# Find the process running on the specified port using the 'php -S' command
pid=$(ps aux | grep "php -S localhost:${port_number}" | grep -v grep | awk '{print $2}')

if [ -z "$pid" ]; then
    echo -e "${GREEN}No 'php -S' server found running on port ${port_number}.${RESET}"
else
    # Kill the process running on the specified port
    kill -9 $pid
    echo -e "${GREEN}Localhost server running on port ${port_number} has been stopped.${RESET}"
fi
