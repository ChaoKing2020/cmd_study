@echo off

git add .
git commit -m 'init'
git pull git@github.com:ChaoKing2020/cmd_study.git main
git push git@github.com:ChaoKing2020/cmd_study.git master:main

pause