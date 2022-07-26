

![](https://p6.toutiaoimg.com/origin/pgc-image/4f3beebebdd74d1fbabadd363e8f4405?from=pc)

~~~shell
git config -l  # 查看当前配
git status  # 查看当前状态。

git checkout -b dev  # 建立一个新的本地分支dev。
git branch -a  # 查看所有的分支。
git branch -D dev  # 删除本地分支dev。

git clone url  # 克隆项目到本地。

git remote add origin git@github.com:ChaoKing2020/study.git  # 添加远程仓库地址的别名origin
git remote rm origin  # 删除远程仓库地址origin

git pull --rebase origin main  # 拉取远程仓库下main分支的代码并与本地代码合并
# git pull = git fetch + git merge。git fetch从远程仓库拉取最新版到本地，git merge自动合并远程仓库的代码。

git pull origin <远程分支名>:<本地分支名>
git pull origin <远程分支名>
git pull

git push origin <本地分支名>:<远程分支名>
git push origin <本地分支名>
git push


#  更新并同步四部曲
git add .  # 提交至暂存区
git commit -m 'init'  # 提交至本地仓库
git commit -am 'init'  # 当没有创建新文件时，可以用这种写法。它包含了add和commit
git pull git@github.com:ChaoKing2020/study.git main
git push git@github.com:ChaoKing2020/study.git master:main
~~~



### 1、git fetch

#### 1.1、需要在本地额外新建分支

~~~shell
# 查看远程
git remote -v 
# 获取远程master的分支的代码到临时新建的temp
git fetch origin master:temp  
# 查看temp分支与当前分支的差异
git diff temp  
# 将临时分支temp合并到当前分支
git merge tmep
# 删除临时分支
git branch -D temp
~~~

#### 1.2、不要在本地新建分支

```shell
# 查看远程
git remote -v
# 获取远程的master分支
git fetch origin master  
# 查看远程master分支与本地master分支的差别
git log -p master..origin/master  
# 合并到本地分支
git merge origin/master
```

### 2、git pull

> git pull相当于git fetch与git merge一起使用，但是这样使用容易出错，所以推荐第一种方式。

```shell
# 查看远程
git remote -v
# 拉取并合并到本地分支
git pull origin master  # 拉取远程的master分支合并到当前分支
```



~~~shell
ssh-keygen -t rsa -C "email@example.com"
# 使用ssh登陆。与本机绑定，需要在github上添加public key，key的内容位于本机C盘用户目录下的.ssh中，将id_rsa.pub中的内容复制到key中。
~~~

