#!/bin/bash

sleep 1

#--------------------- Adding local model directory to the main .sdf



#---------------------EDGE

TERMINAL_ID_0=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.terminalIdsForSessionId 0)
qdbus org.kde.yakuake /yakuake/tabs setTabTitle 0 "Simulator"

SESSION_ID_1=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.addSession)
TERMINAL_ID_1=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.terminalIdsForSessionId 1)
qdbus org.kde.yakuake /yakuake/tabs setTabTitle 1 "Gazebo2Robocomp"


SESSION_ID_2=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.addSession)
TERMINAL_ID_2=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.terminalIdsForSessionId 2)
qdbus org.kde.yakuake /yakuake/tabs setTabTitle 2 "Other"

qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.splitTerminalTopBottom "$TERMINAL_ID_2"	
qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.splitTerminalTopBottom "$TERMINAL_ID_2" 


#---------------------GAZEBO SIMULATOR------------------------

qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 0 "export GZ_SIM_RESOURCE_PATH=./local_models/" #- Adding local model directory to the main .sdf
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 0 "rcnode&"
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 0 "cd ~/Repositories/GazeboWorld_Robolab_Pabellon"
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 0 "gz sim robolab_pabellon.sdf"

sleep 4

#---------------------Gazebo2Robocomp------------------------

qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 1 "cd ~/Repositories/gazebo-bridge/"
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 1 "bin/Gazebo2Robocomp etc/config"

sleep 1
#----------------------------------------------------------------------------------------------------#

