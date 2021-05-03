#!/bin/bash

if [ "$(ls -1 $BEDROCK_SERVER_PATH/resource_packs/ | wc -l)" -lt "1" ];
then
    echo "Found empty resource_packs folder, extracting from archive"
    unzip $BEDROCK_SERVER_ACHIVE_FILE resource_packs/* $BEDROCK_SERVER_PATH/resource_packs/
fi

if [ "$(ls -1 $BEDROCK_SERVER_PATH/behavior_packs/ | wc -l)" -lt "1" ];
then
    echo "Found empty behavior_packs folder, extracting from archive"
    unzip $BEDROCK_SERVER_ACHIVE_FILE behavior_packs/* $BEDROCK_SERVER_PATH/behavior_packs/
fi




LD_LIBRARY_PATH=. ./bedrock_server