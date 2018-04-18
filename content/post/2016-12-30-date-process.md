---
title: 地震时间处理
date: 2016-12-30
lastmod: 2018-04-13
author: Qipeng Bai
categories:
  - 计算机科学
tags:
  - 数据处理
  - Shell
slug: date-process
---

---
通常在处理地震数据（尤其是SAC数据）时需要计算不同时间戳（Time Stamp），本文给出一些示例。

<!--more-->

### C 中的时间计算、转换
地震的时间处理，主要是对不同格式的转换，这里我先给出一个转换的C程序。

``` C
#include "stdio.h"
main()
{
int day,month,year,sum,leap;
scanf("%d-%d-%d",&year,&month,&day);
switch(month) /*先计算某月以前月份的总天数*/
{
  case 1:sum=0;break;
  case 2:sum=31;break;
  case 3:sum=59;break;
  case 4:sum=90;break;
  case 5:sum=120;break;
  case 6:sum=151;break;
  case 7:sum=181;break;
  case 8:sum=212;break;
  case 9:sum=243;break;
  case 10:sum=273;break;
printf("%d",sum);
}  
printf("%d",sum);
}
```
一般来说，时间处理主要是进行以下几件工作：

- 时间格式转换
- 时间差计算
- 时间统计-程序运行

地震学中的问题主要是时间的格式转换和时差计算，

### Shell中的时间格式转换、时差计算

date通常情况下可以分： `年月日 时分秒` 一般情况下需要对date做四则运算。shell中命令的空格要严格控制，等号两边无空格，有多余空格会出现错误，这中限制在日期date命令中就比较明显。

命令格式：
``` bash
date [-u] [-d datestr] [-s datestr] [--utc] [--universal] [--date=datestr] [--set=datestr] [--help] [-version] [+FORMAT] [MMDDhhmm[[CC]YY][.ss]]
```
通常我们拿到的时间格式会有以下几种：

- CSV: `%Y-%m-%dT%H:%M:%SZ` 例如：`2016-10-21T05:07:23.000Z`
- SAC: `%Y %j %H %M %S` 例如： `2016 295 05 07 23.00`，或者是 `saclst kzdate kztime f sacfile` 得到 `%Y/%m/%d %H:%M:%S` 的时间格式
- 其他: 例如 `2016年 10月 21日 星期五 05：07：23 CST`等

date显示指定格式的时间 `date -d "STRING" +"FORMAT"`，尽量加上双引号，避免空格。由此我们可以这样计算，取出时间处理成`%Y-%m-%d %H:%M:%S`格式，然后转换成自 `UTC` 时间`1970-01-01 00:00:00` 以来所有时间的秒数，然后通过秒数进行四则运算，最后再转换为想要的格式。这里暂且定义 `%Y-%m-%d %H:%M:%S` 为标准格式，其他时间都以此为对比标准。
``` bash
#! /bin/bash
catalog=query.csv
outfile=LocalTime
localtimezone=$1

gawk -F "," 'NR>=2 {print $1}' $catalog | sed 's/Z/ /g' | sed 's/T/ /g' > StandardTime
echo -e "\033[35m\tStandard time: \033[0m"
cat StandardTime
cat StandardTime | while read line
do
        UTCtimestamp=`date -d "$line" +%s`
        localtimestamp=`expr $UTCtimestamp + $localtimezone \* 60 \* 60 | bc` # oneday=86400(s)
        echo `date -d @$localtimestamp +"%Y %j %H %M %S"` >> LocalTime
done
echo -e "\033[35m\tLocal time: \033[0m"
cat LocalTime
rm -rf StandardTime
```
  
```bash
#! /bin/bash
if [ $# -ne 2 ];
then
        echo 'Usage: SAC2standTime.sh filepath timezone(hour)'
else
sacpath=$1
localtimezone=$2 # 指定时区校正值,
sac="*.U"
cd $sacpath/
line=`saclst kzdate kztime f $sac | head -1 | gawk '{split($2,aa,"/");print aa[1]"-"aa[2]"-"aa[3],$3}'`
localtimestamp=`date -d "$line" +%s`
UTCtimestamp=`expr $localtimestamp - $localtimezone \* 60 \* 60 | bc` # oneday=86400(s) onehour=3600(s)
echo `date -d @$UTCtimestamp +"%Y %j %H %M %S"`
fi
```

通过上述两个shell脚本将标准时间和SAC中的时间进行互相转换，有效！

### Python中的date运算；
### Perl中的date运算；

-----
### Reference: