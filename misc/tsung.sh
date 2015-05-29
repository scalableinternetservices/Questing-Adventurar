#!/bin/zsh
sed "s/SERVER_PATH_PLACEHOLDER/$2/g" Questing-Adventurer/load_tests/test.xml > test.xml
scp -i Questing-Adventurer.pem test.xml ec2-user@$1:~
ssh -i Questing-Adventurer.pem ec2-user@$1
rm test.xml
