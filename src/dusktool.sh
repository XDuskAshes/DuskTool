#!/usr/bin/bash

version="DuskTool-BASH 1.0.0"

main () {
    clear
    echo $version
    echo "1 - Check /bin/ for a program"
    echo "2 - Check /usr/bin/ for a program"
    echo "3 - Program info"
    echo "Ctrl+C to exit."
    echo -n "Enter number: "
    read choice
    if [ "$choice" = "1" ]; then
        echo -n "Check for what: "
        read checkfor
        checkbin "$checkfor"    
        main
    elif [ "$choice" = "2" ]; then
        echo -n "Check for what: "
        read checkfor
        checkusrbin "$checkfor"
        main
    fi
}

checkbin () {
    ls /bin/ > "$HOME/bin.txt"
    grep -F "$1" "$HOME/bin.txt"
    rm "$HOME/bin.txt"
    pause
}

checkusrbin () {
    ls /usr/bin/ > "$HOME/usrbin.txt"
    grep -F "$1" "$HOME/usrbin.txt"
    rm "$HOME/usrbin.txt"
    pause
}

pause () {
    echo "Press any key to continue..."
    read -r 
}


main
