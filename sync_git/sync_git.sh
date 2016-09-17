#!/bin/sh

# 记录执行日志
echo -e "[`date`] 执行{$1}同步操作" >> log.txt

# 设置其他用户执行分发操作最终用户
WEB_USER="nginx"

# 判断分发环境
if [ ! -d $1/.git ]; then
  rm -rf $1
  git clone $2 $1
fi

cd $1

# 清除未提交作业
git clean -f
git checkout -f

# 拉取最新代码
git pull origin master

# 改变用户权限
chown -R $WEB_USER:$WEB_USER $1
chmod -R 777 $1
