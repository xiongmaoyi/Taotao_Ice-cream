#!/bin/bash
ID=`ps -ef | grep com.g12.ttxg.TtxgApplication|awk '{print $2}'|head -1`
echo ${ID}
kill -9 ${ID}