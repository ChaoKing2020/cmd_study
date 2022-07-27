

![](https://p6.toutiaoimg.com/origin/pgc-image/4f3beebebdd74d1fbabadd363e8f4405?from=pc)

~~~shell
git init   # 初始化环境
git add .  # 将当前目录下得所有文件添加至本地仓库
git pull origin master  
git push -u origin master  # 将当前缓冲区的文件上传至远程仓库的master分支。

git config -l  # 当前配置信息

git status  # 查看当前状态。
git commit -m '#'  # 提交。
git branch -a  # 查看所有的分支。
git checkout -b dev  # 建立一个新的本地分支dev。
git branch -d dev    # 删除本地分支dev。

git clone url  # 克隆项目到本地。

git remote rm origin  # 删除远程仓库地址
git remote add origin git@github.com:ChaoKing2020/study.git  # 添加远程仓库地址

git pull origin main  # 拉取远程仓库下main分支的代码并与本地代码合并
# git pull = git fetch + git merge。git fetch从远程仓库拉取最新版到本地，git merge自动合并远程仓库的代码。
~~~



