申请到顶级域名后，可以将二级域名和 GitHub Pages 的项目仓库进行绑定，做到分仓库管理网站。这样可以在不修改主站的情况下对不同工作进行分类汇总。

<!--more-->

## DNS 二级域名设置

在 GoDaddy 域名管理中修改 DNS 如下：

| 类型           |      名称     |       值                  |   TTL      |
|:--------------|:--------------|:-------------------------|:------------|
| A             |       @       |  192.30.252.153          | 1小时       |
| CNAME         |       www     |       @                  |  1小时      |
| CNAME         |       blog    |       @                  |  1小时      |
| ...           |               |                          |             |


## 绑定 GitHub Pages

在二级域名设置好后，在 GitHub 页面上传建成的网站，这里可以使用三种方式放置页面，`master`、 `gh-pages`、 `master/docs`，推荐使用第二种方式。

项目仓库根目录下放置一 `CNAME` 文件，里面写二级域名，例如 `blog.baiqp.info`，然后在仓库设置页面调整好 GitHub Pages 的设置。等待一定时间提醒配置好后进入页面。

这里列出常用的几个二级链接：

1. [blog](http://blog.baiqp.info)
2. [music](http://music.baipq.info)
3. [wiki](http://wiki.baiqp.info)


### 项目撰写注意事项

因为这里使用的 GitHub Pages 进行发布，需要符合标准，请仔细阅读[错误帮助手册](https://help.github.com/articles/troubleshooting-github-pages-builds/)，完整的 GitHub 帮助手册请参考 [Help github](https://help.github.com/)。格式有错误会导致发布报错。

- Markdown 语法参考<sup>[[1]](#ref01)</sup>
- 图片引用的名称和 `images/` 下的命名保持一致；
- 表格的格式要注意，具体格式如下：
使用 `Markdown` 画的表格，如下表（**冒号表示对齐**）

| col. 1        | col. 2        | col. 3  |
| :------------ |:-------------:| -------:|
| col 3 is      | right-aligned | $1600   |
| col 2 is      | centered      |   $12   |
| zebra stripes | are neat      |    $1   |

或

| col. 1        | col. 2        | col. 3  |
| :------------ |:------------- | :-------|
| col 3 is      | right-aligned | $1600   |
| col 2 is      | centered      |   $12   |
| zebra stripes | are neat      |    $1   |

- 在上传到 GitHub Pages 项目 `gh-pages` 时，可以先清空远程分支，再上传（效果还要验证）；


## 参考资料

1. <a id="ref01">[Even Markdown帮助](https://blog.olowolo.com/example-site/post/even-preview/#ref01)</a>