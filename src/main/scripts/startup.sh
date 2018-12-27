#!/bin/bash
nohup java -classpath './lib/*:./conf/' com.g12.ttxg.TtxgApplication >TtxgApplication.log 2>&1 &