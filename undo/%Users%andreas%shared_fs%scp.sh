Vim�UnDo� &���U�-MH�;v\^��e��3�����`�   0   
# Function   !   	      	       	   	   	    g�|p    _�                             ����                                                                                                                                                                                                                                                                                                                                                  V        g�{+     �   "                   echo -e "${BLUE}[SCP] ${YELL�   #            �                  �               �                  5��                          �                      �                          �               �      �    "                      �              f      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        g�{/     �         0      Rscp andrebn@login.uio.no:in3000/andrebn_joncb/2_pre/image /Users/andreas/shared_fs5��                          &                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        g�{1    �          0      %ssh uio 'cd in3000; ./make_script.sh'5��                                                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 v        g�{z    �         +       �         +    �         0      # Colors for pretty output   RED="\e[31m"   GREEN="\e[32m"   YELLOW="\e[33m"   BLUE="\e[34m"   ENDCOLOR="\e[0m"5��                         �       e               �                          �               �       5�_�                       >    ����                                                                                                                                                                                                                                                                                                                                                             g�{�    �         1      ?    ssh "$REMOTE_USER@$REMOTE_HOST" "cd $REMOTE_DIR && make -B"�         1    5��       >                  �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                            0   
                  v        g�|     �   "   3   $      # Function to�   #   $   $    �      $          �             �         1   *   !# Colors (Cross-shell compatible)   RED=$(tput setaf 1)   GREEN=$(tput setaf 2)   YELLOW=$(tput setaf 3)   BLUE=$(tput setaf 4)   ENDCOLOR=$(tput sgr0)           # Remote and local paths   REMOTE_USER="andrebn"   REMOTE_HOST="login.uio.no"   'REMOTE_DIR="in3000/andrebn_joncb/2_pre"   $LOCAL_DIR="/Users/andreas/shared_fs"   IMAGE_NAME="image"       # Function to compile remotely   compile_remote() {   F    echo -e "${BLUE}[SSH] ${YELLOW}Connecting to remote...${ENDCOLOR}"   P    ssh "$REMOTE_USER@$REMOTE_HOST" "cd $REMOTE_DIR && make -B > /dev/null 2>&1"           if [[ $? -ne 0 ]]; then   H        echo -e "${RED}[Error] Compilation failed on remote.${ENDCOLOR}"           exit 1       fi   L    echo -e "${GREEN}[Makefile] ${YELLOW}Compilation successful!${ENDCOLOR}"   }       %# Function to transfer compiled image   fetch_image() {   I    echo -e "${BLUE}[SCP] ${YELLOW}Fetching compiled image...${ENDCOLOR}"   H    scp "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/$IMAGE_NAME" "$LOCAL_DIR"           if [[ $? -ne 0 ]]; then   A        echo -e "${RED}[Error] Failed to fetch image.${ENDCOLOR}"           exit 1       fi   K    echo -e "${GREEN}[SCP] ${YELLOW}Image fetched successfully!${ENDCOLOR}"   }       # Execute functions   compile_remote   fetch_image5��           )              �       �              �                         �               �      �    "                     �              �      5�_�                           ����                                                                                                                                                                                                                                                                                                                               
                  v        g�|     �                #!/bin/bash5��                          �                      5�_�      	                      ����                                                                                                                                                                                                                                                                                                                               
                  v        g�|    �                 5��                          �                      5�_�                  	           ����                                                                                                                                                                                                                                                                                                                            0                      v        g�|o    �                  
# Function�   !            �                  �               �              -   #!/bin/bash       !# Colors (Cross-shell compatible)   RED=$(tput setaf 1)   GREEN=$(tput setaf 2)   YELLOW=$(tput setaf 3)   BLUE=$(tput setaf 4)   ENDCOLOR=$(tput sgr0)       # Remote and local paths   REMOTE_USER="andrebn"   REMOTE_HOST="login.uio.no"   'REMOTE_DIR="in3000/andrebn_joncb/2_pre"   $LOCAL_DIR="/Users/andreas/shared_fs"   IMAGE_NAME="image"       .# Function to compile remotely (Silent `make`)   compile_remote() {   F    echo -e "${BLUE}[SSH] ${YELLOW}Connecting to remote...${ENDCOLOR}"   P    ssh "$REMOTE_USER@$REMOTE_HOST" "cd $REMOTE_DIR && make -B > /dev/null 2>&1"           if [[ $? -ne 0 ]]; then   H        echo -e "${RED}[Error] Compilation failed on remote.${ENDCOLOR}"           exit 1       fi   L    echo -e "${GREEN}[Makefile] ${YELLOW}Compilation successful!${ENDCOLOR}"   }       %# Function to transfer compiled image   fetch_image() {   I    echo -e "${BLUE}[SCP] ${YELLOW}Fetching compiled image...${ENDCOLOR}"   Y    scp "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/$IMAGE_NAME" "$LOCAL_DIR" > /dev/null 2>&1           if [[ $? -ne 0 ]]; then   A        echo -e "${RED}[Error] Failed to fetch image.${ENDCOLOR}"           exit 1       fi   K    echo -e "${GREEN}[SCP] ${YELLOW}Image fetched successfully!${ENDCOLOR}"   }       # Execute functions   compile_remote   fetch_image        5��           ,               �       �              �                      
   �               �      �        
                  �              �      5��