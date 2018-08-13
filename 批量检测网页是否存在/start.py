#!/usr/bin/env python3
# author: hjxfire
# Copyright (C) 2018 hjxfire <hjxfire@outlook.com>
# 用法: python3 start.py
# urls文件夹中放入需要检测的网页链接,html文件夹用来存放检测结果(html格式)
# 连接不上（默认timeout为5秒，位于access()函数中，可自行修改）或者404的链接会直接去除,结果中会存放其他所有链接及对应状态码
import os
import requests

#urls文件夹
URLSPATH='urls/'
#输出文件夹
OUTPUTPATH='html/'

#获取存放urls文件的路径和名称
def getFilesPath(dirPath):
    filesAbsolutePath=[]
    filesname=[]
    for root, dirs, files in os.walk(dirPath):
        for filesPath in files:
            filesAbsolutePath.append(os.path.join(root, filesPath))
            filesname.append(os.path.splitext(filesPath)[0])
    return filesAbsolutePath,filesname

#用于访问验证
def access(url):
    try:
        #timeout默认为5秒
        r=requests.get(url,timeout=5)
        status = r.status_code
    except Exception as e:
        status=404
    return status

def processData(filepath,htmlFile):
    #获取url
    urlsFile=open(filepath,'r')
    urlslist=list(urlsFile)
    #访问验证
    for url in urlslist:
        url=url.strip()  #去掉字符串末尾的\n
        print(url)
        status=access(url)
        if(status!=404):
            htmlFile.write("<a href='"+url+"'>"+url+"</a>"+"&nbsp;"+str(status)+"<br/>\n")

filesAbsolutePath,filesname=getFilesPath(URLSPATH)
i=0
for path,filename in zip(filesAbsolutePath,filesname):
    htmlFile = open(OUTPUTPATH + filename + '.html', 'w')
    processData(path,htmlFile)
    htmlFile.close()
    i+=1
