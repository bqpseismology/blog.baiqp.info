`MkDocs` 可同时编译多个 MarkDown 文件，形成书籍一样的文件。也可以选择不同主题，时刻项目使用。当然也有其他框架选择<sup>[[1]](#ref01)</sup>

-----

<!--more-->

使用静态网页生成可以帮助我们大大简化工作的整理和发布，有助于科研积累，交流。所以，欢快的开始一个新博客吧 ：smile:

## 1. MkDocs 安装配置

[MkDocs 官网](http://www.mkdocs.org/)，安装很方便，这里不再给出具体说明。

### 1.1 主题选择

可以通过修改主题来个性化，这里选择了一个学术味浓的一个主题 [Material](https://squidfunk.github.io/mkdocs-material/)
直接使用 `pip install mkdocs-material` 安装。修改 `mkdocs.yml` 文件即可。

### 1.2 发布至 GitHub Pages

将代码发布在 `master` 分支，将博客发布在 `gh-pages` 分支。具体参考 `mkdocs gh-deploy` 用法。

-----

## 2. Liquid 语言

个性化模版时，通常会接触到进行变量替换，就涉及到了 [Liquid](https://liquid.bootcss.com/) 语言，其是一门灵活的模版语言，尤其是 GitHub Pages 底层使用的 Jekyll 调用的就是稳定版本的 [Liquid](https://shopify.github.io/liquid/)

-----

## 3. Sphinx 搭配 Read the Docs 撰写文档 

[Sphinx + Read the Docs 写最好的文档](https://avnpc.com/pages/writing-best-documentation-by-sphinx-github-readthedocs)，可以支持输出为PDF等格式。

-----

## 参考资料

1. <a id="ref01">[静态网站生成器排行](https://staticsitegenerators.net/)</a>
