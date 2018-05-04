<!--more-->

## 数据下载

在 [IRIS](http://www.iris.edu/hq/) 官网下载远震数据，震中距30°--90°，以seed格式放置在个人目录

## 反演简单操作步骤

将计算断层辅助面的脚本放置在用户bin执行目录，根据实际情况执行如下命令(XXX 为实际目录位置，注意修改)：

```
$ mv cap_source/etc_commands/to_conjugate.awk ~/soft/bin/
```

进入个人目录，根据具体情况执行如下命令

```
$ mv 2017-7-17_6.2_Russia.562133.seed tel.seed
$ sh LeadData.sh tel.seed
$ sh LeadCAP.cmd
$ cd data
$ cp ../etc_commands/mecherr.cmd .
$ sh mecherr.cmd
$ gs mecherr.ps
$ gs vmodel_20.ps
```

## 结果分析

结果分析请参考相应的论文和文章。
