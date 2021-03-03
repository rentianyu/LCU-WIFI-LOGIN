#!/usr/bin/env bash
# 此脚本为聊城大学2021年校园网自动登录的Shell脚本
# 此脚本仅供学习交流使用
# 用法为在登录前按F12抓包，登录成功后找http://172.30.2.2:8088/eportal/success.jsp?userIndex****的Cookie和Referer，将所需值填入对应位置后运行脚本即可

# Cookie内EPORTAL_COOKIE_USERNAME值，即 学号，为10位
userId=2017*****8
# Cookie内EPORTAL_COOKIE_PASSWORD的值，即 新版密码加密后的值，为256位
password=66202****488b487
# Referer内nasportid的值，不清楚，填就是了，为80位
nasportid=14079****08a84c

# 编码有关值
u=$(curl -sL http://172.30.2.2:8088 | grep -oE "wlanuserip.*=" | sed "s/=/%253d/g; s/&/%2526/g")
# 进行登录
curl -d "userId=${userId}&password=${password}&service=&queryString=${u}${nasportid}&operatorPwd=&operatorUserId=&validcode=&passwordEncrypt=true" "http://172.30.2.2:8088/eportal/InterFace.do?method=login"