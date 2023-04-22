#!/usr/bin/bash

# check if STEP is unset and init with 0
test -f "/tmp/STEP" || echo 0 > /tmp/STEP

STEP=$(cat "/tmp/STEP")
getopts "npsev:" opt
  case "${opt}" in
    n)
      STEP=$(expr $STEP + 1) 
      echo $STEP > /tmp/STEP
      ;;
    p)
      STEP=$(expr $STEP - 2)
      echo $STEP > /tmp/STEP
      ;;
    s)
      STEP=0
      echo $STEP > /tmp/STEP
      ;;
    e)
      STEP=-1
      echo $STEP > /tmp/STEP
      ;;
    v)
      STEP=${OPTARG}
      echo $STEP > /tmp/STEP
      ;;
  esac

case $STEP in
  0)
    toilet -f broadway -F border -w 90 "LINUX BASICS" | lolcat
    echo "©Sarthak Shah                                                    $(date +'%A, %d %B %Y')"
    ;;
    # "Say you have a folder with 50 images"
    # "You wanna rename them all to the date they were taken on"
    # "How would you do it?"
    # Do it with shell scripting
  1)
    toilet -f mono9 -F border "1. What is a terminal?" | lolcat
    ;;
    # section on history of terminals and terminal emulators
    # go over quickly to explain why we still use CLI
    # benefits of CLI
    # "You will soon witness them yourself...."
  2)
    toilet -f mono9 -F border -w 100 "2. Navigating the terminal!" | lolcat
    ;;
    # moving around directories and peeking at contents
    # quicc move haxx (.., ., -)
  3)
    toilet -f mono9 -F border -w 100 "3. Some common commands!" | lolcat
    ;;
    # LOTS to cover
    # Will probably take the most time
  4)
    toilet -f mono9 -F border -w 95 "4. Branching and Looping!" | lolcat
    ;;
    # Go over loop in example in >>1
  5)
    toilet -f mono9 -F border "5. Some fun examples!" | lolcat
    ;;
    # Take suggestions from members for examples
  *)
    toilet -f ascii12 -F border -w 90 "fin." | lolcat
    echo "©Sarthak Shah       $(date +'%A, %d %B %Y')"
    STEP=-1
    ;;
esac

# increment!
echo $(expr $STEP + 1) > /tmp/STEP
