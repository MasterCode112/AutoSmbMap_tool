# MasterCode Auto SMB Map Tool
MasterCode Auto SMB Map Tool is a simple Bash script designed to automate the process of checking SMB shares across multiple IP addresses. The tool checks if SMB is accessible, runs smbmap to enumerate shares, and saves the results for each IP in an organized manner. This tool is useful for network administrators, security professionals, or penetration testers who need to quickly enumerate SMB shares across a range of IPs.

## Features:
- Reads a list of IP addresses from a file.
- Uses smbmap to enumerate available SMB shares for each IP.
- Saves output in individual files organized by IP address.
- Creates a dedicated folder (smb_map_output) to store the output files.

## Installation and Prerequisites
Ensure that smbmap is installed on your system.
You can install smbmap via pip (Python package manager):
```bash
pip install smbmap
```
Ensure bash is available on your system (typically pre-installed on Linux and macOS).

## Usage
**Step 1: Prepare the IPs File**
Create a text file (ips.txt) containing the IP addresses to scan for SMB shares.

Example (ips.txt):
```
10.122.1.1
10.122.1.2
10.122.1.3
10.122.1.4
```
**Step 2: Run the Script**
Save the script as AutoSmbMap.sh on your system.

Make the script executable:
```bash
chmod +x AutoSmbMap.sh
```
Run the script with the -f flag followed by the file name (ips.txt):

```bash
./AutoSmbMap.sh -f ips.txt
```
**Step 3: Review the Output**
The script will:
- Check each IP from ips.txt.
- Run smbmap to scan for accessible SMB shares.
- Save the output for each IP in a folder named smb_map_output.

**Output Files:**
The output for each IP will be saved as smbmap_output_<ip>.txt.
Example: `smbmap_output_10.122.1.1.txt`

## Example Output:
```css
[*] Checking SMB on 10.122.1.1
[-] Failed to run smbmap on 10.122.1.1
[*] Checking SMB on 10.122.1.2
[+] SMBmap output saved for 10.122.1.2 in smb_map_output/smbmap_output_10.122.1.2.txt
[*] Checking SMB on 10.122.1.3
[+] SMBmap output saved for 10.122.1.3 in smb_map_output/smbmap_output_10.122.1.3.txt
```
