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