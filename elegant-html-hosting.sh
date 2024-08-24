#!/bin/bash

# Define some colors for styling the terminal output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Clear the screen
clear

# Welcome message
printf "${CYAN}Welcome to the Stylish HTML Generator Script!${RESET}\n"
printf "${GREEN}This script will create a stylish HTML page or allow you to host your own file.${RESET}\n"

# Check if PHP is installed
if ! command -v php &> /dev/null; then
    printf "${BLUE}PHP is not installed. Installing PHP...${RESET}\n"
    # Determine if using Termux or Kali Linux
    if [ -f "/data/data/com.termux/files/usr/bin/termux-info" ]; then
        apt install php -y
    else
        sudo apt install php -y
    fi
else
    printf "${GREEN}PHP is already installed. Proceeding...${RESET}\n"
fi

# Inform the user about the demo script
printf "${GREEN}This is a demo script that can host a stylish HTML page.${RESET}\n"
printf "${CYAN}Do you want to host your own file (y/n)? ${RESET}"
read host_own_file_choice

if [ "$host_own_file_choice" = "y" ]; then
    # Ask user for the name of the file to host
    printf "${BLUE}Enter the name of the file you want to host (e.g., index.html): ${RESET}"
    read user_file

    # Ask user for the port they want to use
    printf "${BLUE}Enter the port number you want to use for hosting: ${RESET}"
    read port_number

    # Host the specified file on the chosen port
    printf "${GREEN}Starting the server...${RESET}\n"
    php -S localhost:${port_number} /data/data/com.termux/files/home/${user_file} > /dev/null 2>&1 &
    printf "${CYAN}Your file ${BLUE}${user_file}${CYAN} is now hosted on ${BLUE}http://localhost:${port_number}${CYAN}.${RESET}\n"
    printf "${CYAN}Do you want to host it on the internet (y/n)? ${RESET}"
    read host_internet_choice

    if [ "$host_internet_choice" = "y" ]; then
        # Host on the internet using localhost.run
        printf "${GREEN}Hosting on the internet...${RESET}\n"
        ssh -R 80:localhost:${port_number} localhost.run
    else
        printf "${GREEN}Local hosting will continue. Use ${BLUE}Ctrl + C${GREEN} to stop the server.${RESET}\n"
    fi

else
    # Proceed with the demo hosting
    # Ask user to input the word to display on the demo HTML page
    printf "${BLUE}Enter the word you want to display on the demo HTML page: ${RESET}"
    read user_word

    # Create the demo HTML file
    cat <<EOF > /data/data/com.termux/files/home/demo.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stylish Demo HTML</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            color: #fff;
            text-align: center;
            margin-top: 20%;
        }
        h1 {
            font-size: 4em;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
    </style>
</head>
<body>
    <h1>${user_word}</h1>
    <p>This page is dynamically generated using a shell script.</p>
</body>
</html>
EOF

    printf "${GREEN}Demo HTML file created successfully!${RESET}\n"

    # Host the demo HTML file on port 2525
    printf "${GREEN}Starting the demo server...${RESET}\n"
    php -S localhost:2525 /data/data/com.termux/files/home/demo.html > /dev/null 2>&1 &
    printf "${CYAN}Your demo HTML page is now hosted on ${BLUE}http://localhost:2525${CYAN}.${RESET}\n"
    printf "${CYAN}Do you want to host it on the internet (y/n)? ${RESET}"
    read host_internet_choice

    if [ "$host_internet_choice" = "y" ]; then
        # Host on the internet using localhost.run
        printf "${GREEN}Hosting on the internet...${RESET}\n"
        ssh -R 80:localhost:2525 localhost.run
    else
        printf "${GREEN}Local hosting will continue. Use ${BLUE}Ctrl + C${GREEN} to stop the server.${RESET}\n"
    fi
fi
