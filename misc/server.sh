#!/bin/zsh
scp -i Questing-Adventurer.pem ec2-user@$1:app/log/production.log .
