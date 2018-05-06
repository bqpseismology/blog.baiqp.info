本文整理了 MarkDown 基本语法，以及博客主题的语法扩展和限值。在日常编辑中，注意书写规则的统一、清晰、简洁。 

<!--more-->

**本文完整语法只适用于网页版**，开发者英文版语法说明可参考[Markdown: Syntax](https://daringfireball.net/projects/markdown/syntax)，翻译中文版参考[Markdown 语法说明 (简体中文版)]
(https://www.appinn.com/markdown/)

## Even 主题 MarkDown 语法

> Copy from [《Hugo 主题 Nuo 文章样式预览》](https://laozhu.me/post/hugo-nuo-post-preview/)

这篇文章集中说明主题所支持的 Markdown 语法和 Hugo Shortcodes 插件，你也可以在这里预览到他们的样子。如果你不喜欢某些样式，可以去修改 css/ 文件夹下的 .scss 文件。

# 1.标题

# H1
## H2
### H3
#### H4
##### H5
###### H6

## 2. 段落

使用单引号 `*` 或者单下划线 `_` 标记 *斜体强调* 或者 _斜体强调_

使用两个引号 `**` 或者两个下划线 `__` 标记 **加粗强调** 或者 __加粗强调__

引号和下划线可叠加使用 → **只是加粗 _斜体并加粗_**

使用两个波浪线 `~~` 标记 ~~已删除文字~~

插入文字暂无 `Markdown` 标记，直接使用 `HTML` 标签 `<ins>` 标记 <ins>插入文字</ins>

行内代码使用反引号标记 → `print("hello world")`

上标 X<sup>2</sup> / 下标 X<sub>2</sub>

按键 <kbd>Ctrl</kbd>

外链 [chekun's blog](https://chekun.me)

页面内段落 [图片](#section-07)

*注意：你可以通过 `{#section-id}` 方式自定义段落锚点*

参考资料 <sup>[[1]](#ref01)</sup><sup>[[2]](#ref02)</sup>

## 3. 列表

以下的无序、有序和任务列表均支持二级嵌套，不建议使用二级以上嵌套。

### 3.1 无序列表

* 无序列表
  - 嵌套的无序列表
  - 嵌套的无序列表
* 无序列表
  1. 嵌套的有序列表
  2. 嵌套的有序列表
* 无序列表

### 3.2 有序列表

1. 有序列表
  1. 嵌套的有序列表
  2. 嵌套的有序列表
2. 有序列表
  - 嵌套的无序列表
  - 嵌套的无序列表
3. 有序列表

### 3.3 定义列表

CSS
: 层叠样式表


### 3.4 任务列表

- [ ] Cmd Markdown 开发
  - [ ] 改进 Cmd 渲染算法，使用局部渲染技术提高渲染效率
  - [ ] 支持以 PDF 格式导出文稿
  - [x] 新增Todo列表功能 [语法参考](https://github.com/blog/1375-task-lists-in-gfm-issues-pulls-comments)
  - [x] 改进 LaTex 功能
  - [x] 修复 LaTex 公式渲染问题
  - [x] 新增 LaTex 公式编号功能 [语法参考](http://docs.mathjax.org/en/latest/tex.html#tex-eq-numbers)
- [ ] 七月旅行准备
  - [ ] 准备邮轮上需要携带的物品
  - [ ] 浏览日本免税店的物品
  - [x] 购买蓝宝石公主号七月一日的船票

## 4. 引用

> 野火烧不尽，春风吹又生。
>
> <cite>-- 白居易《赋得古原草送别》</cite>

## 5. 代码

以本站的一段 `JavaScript` 代码做演示。

```javascript
// Initialize video.js player
if (document.getElementById('my-player') !== null) {
  /* eslint-disable no-undef */
  videojs('#my-player', {
    aspectRatio: '16:9',
    fluid: true,
  });
}
```

## 6. 分割线

---

中间能写字的分割线，如果你修改了分割线中字的内容，请配合修改 `CSS` 样式。

## 7. 图片 {#section-07}

不带标题的图片，如下图

![hugo even showcase](https://raw.githubusercontent.com/olOwOlo/hugo-theme-even/master/images/showcase.png "showcase.png")

带标题的图片，如下图

{{% figure class="center" src="https://raw.githubusercontent.com/olOwOlo/hugo-theme-even/master/images/showcase.png" alt="hugo even showcase" title="showcase.png" %}}

## 8. 表格

使用 `Markdown` 画的表格，如下表

| Tables        | Are           | Cool  |
| :------------ |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

## 9. 数学公式

主题使用了 [MathJax](https://www.mathjax.org/) 开源库来实现对数学公式的支持，使用 `$$` 标记。

$$E\_{i}=\sum\_{j}W\_{ij}x\_{j}+b\_{i}$$

## 10. 网易云音乐

主题文章中可以轻松插入 [网易云音乐](https://music.163.com/) 的指定音乐，你可以根据需要将音乐设置为自动播放，在主题目录 `layouts/shortcodes` 文件夹下的 `music.html` 对该标签进行定义。

{{% music "28196554" %}}

自动播放

{{% music id="413829643" auto="1" %}}

## 11. YouTube

由于不明原因可能无法播放。

{{% youtube "rEdl2Uetpvo" %}}

{{% youtube "NaY91YjVbEM" %}}


## 参考资料

1. <a id="ref01">[Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)</a>
2. <a id="ref02">[Markdown 语法手册](https://www.zybuluo.com/EncyKe/note/120103)</a>

----- 

## 注意事项

### 博客撰写格式注意事项

- 在每个文件的开头后不要加分割线，这样容易出现pdf编译标题前乱码(###)的现象。

```
---
title:
author:
---

-----

例如等等
```

### 标题分级

文档的title为一级标题#，内容部分以二级标题开始##

-----

## 相关链接

 - MarkDown在线转PDF www.mdtr2pdf.com/
