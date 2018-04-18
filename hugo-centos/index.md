---
`Hugo` 是由 Go 语言实现的静态网站生成器。简单易用、高效、易扩展、快速部署。

<!--more-->

## 1. Hugo安装配置

具体可参考官方[中文参考文档](http://www.gohugo.org/)

直接安装步骤如下：

- 从[Hugo Releases](https://github.com/spf13/hugo/releases)下载对应操作系统的`Hugo`二进制文件，放在`/bin/`目录下运行
- 安装依赖工具： Git， Mercruial， Go(1.3+)
- 安装 [Visual Studio Code](https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions) ，方便修改代码

注意 `Go` 的高版本编译需要 `Go 1.4` 作为初始编译器，因此要先安装后再安装高版本，可参考 [Go高版本安装](https://blog.csdn.net/beyond__devil/article/details/68064202) 。

### 1.1 让 go get 显示进度

在使用 Go 下载 github 的包比较大时，需要让屏幕显示进度，可以通过修改 Go 源码来实现。打开 `/usr/local/go/src/cmd/go/vcs.go` 文件，如下修改:

``` go
// vcsGit describes how to use Git.
var vcsGit = &vcsCmd{
	name: "Git",
	cmd:  "git",

	createCmd:   "clone {repo} {dir}", // 此处修改为 clone --progress {repo} {dir} update --init --recursive"},
```
``` go
var buf bytes.Buffer
	cmd.Stdout = &buf
	cmd.Stderr = &buf
	cmd.Stdout = os.Stdout // 重定向标准输出
	cmd.Stderr = os.Stderr // 重定向标准输出
	err = cmd.Run()
```
然后运行 `src/all.bash` 重新编译 Go，等编译完成后使用 `go get` 可以看到进度条。

### 1.2 安装 pandoc

使用二进制包安装，具体流程如下：
```
$ wget -c https://github.com/jgm/pandoc/releases/download/2.1.3/pandoc-2.1.3-linux.tar.gz
$ tar -zxvf pandoc-2.1.3-linux.tar.gz
$ su
# mv pandoc-2.1.3 /usr/local/
$ vim ~/.bashrc
At the end of the file, add “export PATH=/usr/local/pandoc-2.1.3/bin:${PATH}”
$ source ~/.bashrc
```
---

## 2. 主题安装

参考 [even](https://github.com/seisman/hugo-theme-even)

- 修改 `/themes/even/src/css/` 目录下的版本文件，调整了网页的样式。
- 修改 `/themes/even/src/fonts/` 目录下的字体文件及 `/themes/even/src/css/_custom/` 的 `_custom.scss` 文件个性化定制页面。

注意修改 `/themes/even/src/` 内任一文件时，要再次编译，编译命令如下：

```
$ cd src/
$ npm install
$ npm run build
``` 
---

## 3. 字体修改

### 3.1 字体安装
字体转换工具可使用 [Everthing Fonts](https://everythingfonts.com/)

**Abode Source Code Pro**

```
$ sudo yum install adobe-source-code-pro-fonts
$ cd /usr/share/fonts/adobe-source-code-pro
```

### 3.2 字体修改
字体修改可参考 [CSS3@font-face](https://www.w3cplus.com/content/css3-font-face)，修改 `/themes/even/src/css/_custom/_custom.scss` 的字体变量列表，具体不再列出。 

执行 `npm install`， `npm run build` 会报错 `Unexpected character '' (1:0)`，可通过如下办法解决：
```
$ vim /themes/even_m/src/webpack.config.js
// 添加如下语句
{ 
  test: /OpenSans-BoldItalic\.(woff|woff2|eot|ttf|otf|svg)$/,
  use: 'file-loader?name=[path][name].[ext]'
}
```
---

## 4. 网站图标修改

修改网站的图表，可修改 `themes/even/static/` 文件夹下的几个图片。也可在根目录 `static/` 中放置此类文件进行覆盖，优先级高于主题模版文件。

- android-chrome-192x192.png
- android-chrome-512x512.png
- apple-touch-icon.png
- browserconfig.xml
- favicon-16x16.png
- favicon-32x32.png
- manifest.json
- mstile-150x150.png
- safari-pinned-tab.svg

---

## 5. Hugo 站点说明
[参考博客](https://blog.coderzh.com/2015/08/29/hugo/)

- `archetypes` ：存放default.md，头文件格式
- `content` ：content目录存放博客文章（.markdown/.md文件）
- `data` ：存放自定义模版，导入的toml文件（或json，yaml）
- `layouts` ：layouts目录存放的是网站的模板文件
- `static` ：static目录存放js/css/img等静态资源
- `config.toml` ：config.toml是网站的配置文件

---