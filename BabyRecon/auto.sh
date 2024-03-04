#!/bin/bash
#Powred By Bo7miiiid 





spinner() {
    local i sp n
    sp='/-\|'
    n=${#sp}
    printf ' '
    while sleep 0.1; do
        printf "%s\b" "${sp:i++%n:1}"
    done
}

printf 'Doing important work '
spinner &

sleep 5  # sleeping for 10 seconds is important work

kill "$!" # kill the spinner
clear 

echo -e "\e[1;33m =============================================================================================================== \e[0m"
echo -e "\e[34m

 ******       **     ******   **    **       *******   ********   ******    *******   ****     **      
/*////**     ****   /*////** //**  **       /**////** /**/////   **////**  **/////** /**/**   /**      
/*   /**    **//**  /*   /**  //****        /**   /** /**       **    //  **     //**/**//**  /**      
/******    **  //** /******    //**         /*******  /******* /**       /**      /**/** //** /**      
/*//// ** **********/*//// **   /**         /**///**  /**////  /**       /**      /**/**  //**/**      
/*    /**/**//////**/*    /**   /**         /**  //** /**      //**    **//**     ** /**   //****      
/******* /**     /**/*******    /**         /**   //**/******** //******  //*******  /**    //***      
///////  //      // ///////     //          //     // ////////   //////    ///////   //      ///    \e[0m"



echo -e "\e[1;33m =========================================Made-By-Bo7Weed======================================================== \e[0m"
                                                                                    


echo -e "\e[32m [*] Categs : Scan-Tools(1) - Exploitation-Tools(2) -  Wordlists(3) - Shell-Generator(4) \e[0m"
echo "                                                                                                         "
read -p " [ Enter What Do you want to do (Enter the corresponding number) ] > " ch

if [[ "$ch" == "1" ]]; then
  echo -e "\e[1;31m [1]Nmap Automator \e[0m"
  echo -e "\e[1;31m [2]Nmap  \e[0m"
  echo -e "\e[1;31m [3]Directory Discovering \e[0m"
  read -p " Here >  " ch2
  
  if [[ "$ch2" == "1" ]]; then
    chmod +x nmapAutomator/nmapAutomator.sh
    read -p "Enter Host Here, and if you want to scan vulners just Add (vulns) after the Host: " host vulns
    ./nmapAutomator/nmapAutomator.sh --host "$host" --type Full "$vulns"
  elif [[ "$ch2" == "2" ]]; then
    read -p "Enter Host Here : " host 
    echo -e "\e[1;31m ** Nmap Has Started ** \e[0m \e[32m Please wait... \e[0m"  
    /usr/bin/nmap -sV "$host" --script vulners
  elif [[ "$ch2" == "3" ]]; then
    read -p "For this scan you need to install FeroxBuster Want you continue ? (y,n)" ch3
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
  echo -e "\e[31mCurrently unavailable. Exploitation tools require caution and responsible use. \e[0m"
  echo -e "\e[31mPlease refer to proper documentation and legal considerations before using such tools.\e[0m"
  echo -e "\e[31m******************************************************************************************* \e[0m"
  ls /usr/share/metasploit-framework/modules/
  echo -e "\e[31m ********************************************************************************************* \e[0m"
  read -p "If You Want To See All These Files ?? (y,n) :" chh
  if [[ "$chh" == "y" ]]; then
    clear
    /usr/bin/tree /usr/share/metasploit-framework/modules/
  else 
    echo -e "\e[1;33m Gooooood Byeee <3 !!\e[0m"
  fi
fi

    

if [[ "$ch" == "4" ]]; then
  cd reverse/
  echo -e "\e[42m [*] Shell Generator has started at http://0.0.0.0:8080/index.html \e[0m"
  python3 -m http.server 8080 

fi
