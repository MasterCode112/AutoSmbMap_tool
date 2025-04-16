#!/bin/bash

# Default help message
function usage() {
    echo "Usage: $0 -f <file_with_ips>"
    exit 1
}

# Check for valid arguments
while getopts "f:" opt; do
    case ${opt} in
        f )
            ips_file=$OPTARG
            ;;
        * )
            usage
            ;;
    esac
done

# Check if the IPs file is provided and exists
if [ -z "$ips_file" ]; then
    echo "Error: No IP file provided."
    usage
elif [ ! -f "$ips_file" ]; then
    echo "Error: The file '$ips_file' does not exist."
    exit 1
fi

# Loop through each IP address in the file
while IFS= read -r ip; do
    # Skip empty lines and comment lines
    if [[ -z "$ip" || "$ip" =~ ^# ]]; then
        continue
    fi

    echo "[*] Checking SMB on $ip"
    
    mkdir -p smb_map_output

    # Run smbmap with the full command
    smbmap -H "$ip" > "smb_map_output/smbmap_output_$ip.txt"
    
    # Check if smbmap was successful
    if [ $? -eq 0 ]; then
        echo "[+] SMBmap output saved for $ip in smb_map_output/smbmap_output_$ip.txt"
    else
        echo "[-] Failed to run smbmap on $ip"
    fi
done < "$ips_file"
