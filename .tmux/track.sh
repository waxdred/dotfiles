#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

track_name() {
  local arr=""
  arr=($(osascript "$HOME/.tmux/apple/name.applescript"))
  for value in "${arr[@]}"
   do
        track="$track $value"
  done
}

statu(){
    localarr=""
    arr=($(osascript "$HOME/.tmux/apple/play.applescript"))
    for value in "${arr[@]}"
    do
        play="$play $value"
    done
    if [ $play == "playing" ]
    then
        play="⏯ "
    elif [ $play == "paused" ]
    then
        play='⏸ '
    else
        play=''
    fi
}

shuffle(){
    localarr=""
    arr=($(osascript "$HOME/.tmux/apple/shuffling.applescript"))
    for value in "${arr[@]}"
    do
        shuffle="$shuffle $value"
    done
    if [ $shuffle == "true" ]
    then
        shuffle="🔀"
    else
        shuffle=''
    fi
}

volume(){
    local arr=""
    arr=($(osascript -e "output volume of (get volume settings)"))
    if (($arr >= 66))
    then
        volume='🔊'
    elif (($arr >= 33))
    then
        volume='🔉'
    elif (($arr < 33 && $arr > 0))
    then
        volume='🔈'
    elif (($arr == 0))
    then
        volume='🔇'
    fi
}

check(){
    local arr=""
    arr=($(osascript "$HOME/.tmux/apple/check.applescript"))
    if [ $arr == "Running" ]
    then
        space=""
        sep=""
        track_name
        statu
        shuffle
        volume
        printf " %s" $shuffle $space $play $space $track $space $volume $sep
    fi
}
main(){
    check
}
main
