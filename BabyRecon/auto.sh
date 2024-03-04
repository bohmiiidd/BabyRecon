#!/bin/bash
#Powred By Bo7miiiid 
echo " #1 Categs : Scan-Tools(1) - Exploitation-Tools(2) -  Wordlists(3) - Shell-Generator(4) " # Corrected category names
read -p "Enter What Do you want to do (Enter the corresponding number): " ch

if [[ "$ch" == "1" ]]; then
  read -p "Nmap Is the First scan, Continue With Automator ?(y,n), else put "brute" for Directory Discovery : " ch2
  
  if [[ "$ch2" == "y" ]]; then
    chmod +x /nmapAutomator/nmapAutomator.sh
    read -p "Enter Host Here, and if you want to scan vulners just Add (vulns) after the Host: " host vulns
    ./nmapAutomator/nmapAutomator.sh --host "$host" --type Full "$vulns"
  elif [[ "$ch2" == "n" ]]; then
    read -p "Enter Host Here : " host 
    echo "Nmap Has Started. Please wait."  
    /usr/bin/nmap -sV "$host" --script vulners
  elif [[ "$ch2" == "brute" ]]; then
    read -p "For this scan you need to install FeroxBuster Want you continue ? " ch3
    if [[ "$ch3" == "y" ]]; then 
      curl -sL https://raw.githubusercontent.com/epi052/feroxbuster/main/install-nix.sh | bash -s $HOME/.local/bin/
    else 
      read -p "Enter Url :" url
      /usr/bin/tree wordlists/
      read -p "Enter wordlist PATH :" path
    fi
    if [[ "$path" != "1" ]]; then
      /root/.local/bin/feroxbuster --url "$url" -w "$path"
    fi
fi 


elif [[ "$ch" == "3" ]]; then
  for directory in wordlists/{metasploit,brutespray,dirb,dirbuster,fern-wifi,wfuzz}; do
    /usr/bin/tree "$directory"
  done
  /usr/bin/tree wordlists/  # Include a final tree for the base directory

elif [[ "$ch" == "2" ]]; then
  echo "Currently unavailable. Exploitation tools require caution and responsible use."
  echo "Please refer to proper documentation and legal considerations before using such tools."
  echo "**************************************"
  ls /usr/share/metasploit-framework/modules/
  echo "***************************************"
  read -p "If You Want To See All These Files ?? (y,n) :" chh
  if [[ "$chh" == "y" ]]; then
    clear
    /usr/bin/tree /usr/share/metasploit-framework/modules/
  else 
    echo "Gooooood Byeee <3 !!"
  fi
fi

    

if [[ "$ch" == "4" ]]; then
  cd reverse/
  python3 -m http.server 8080 
  echo "Shell Generator has started at http://0.0.0.0:8080/index.html"
fi
