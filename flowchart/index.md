本博客支持绘制Web流程图（[UML图](https://baike.baidu.com/item/%E7%BB%9F%E4%B8%80%E5%BB%BA%E6%A8%A1%E8%AF%AD%E8%A8%80/3160571?fromtitle=UML&fromid=446747)），采用的是[flowchart.js](https://github.com/adrai/flowchart.js)和[js-sequence-disgrams](https://bramp.github.io/js-sequence-diagrams/)

<!--more-->

## 怎样绘制 UML 流程图

> flowchart.js 仅需几行代码即可在Web上完成流程图的构建。可以从文字表述中画出简单的SVG流程图，也可以画出彩色的图表。

在MarkDown语法中，流程图的画法和代码段类似，写在两个```之间。

流程图的语法大体分为两部分：

- 前面部分用来定义流程图元素；
- 后面部分用来连接流程图元素，指定流程图的执行走向。

例如下面的代码：

    ```flowchart
    st=>start: Start
    e=>end: End
    op1=>operation: My Operation
    sub1=>subroutine: My Subroutine
    cond=>condition: Yes or No?
    io=>inputoutput: catch something...
    st->op1->cond
    cond(yes)->io->e
    cond(no)->sub1(right)->op1
    ```

```flowchart
st=>start: Start
e=>end: End
op1=>operation: My Operation
sub1=>subroutine: My Subroutine
cond=>condition: Yes or No?
io=>inputoutput: catch something...
st->op1->cond
cond(yes)->io->e
cond(no)->sub1(right)->op1
```
-----

定义元素阶段的语法是：
```
tag=>type: content:>url
```

**说明：**

- tag是流程图中的标签，在第二段连接元素时会用到。名称可以任意，一般为流程的英文缩写和数字的组合。
- type是来确定标签的类型，`=>`后面表示类型。由于标签的名称可以任意指定，所以要依赖type来确定标签的类型
- 标签有6中类型：`start` `end` `operation` `subroutine` `condition` `inputoutput`
- content是流程图文本框中的描述内容，`:`后面表示内容，中英文均可。特别注意，冒号与文本之间一定要有个`空格`
- url是一个连接，与框框中的文本相绑定，`:>`后面就是对应的url链接，点击文本时可以通过链接跳转到url指定页面

连接流程图元素的语法就简单多了，直接用`->`来连接两个元素

**说明：**

- 使用`->`来连接两个元素
- 对于condition类型，有yes和no两个分支，如示例中的cond(yes)和cond(no)
- 每个元素可以制定分支走向，默认向下，也可以用right指向右边，如示例中sub1(right)。

## 怎样绘制 UML 序列图


    ```sequence
    Andrew->China: Says Hello
    Note right of China: China thinks\nabout it
    China-->Andrew: How are you?
    Andrew->>China: I am good thanks!
    ```

```sequence
Andrew->China: Says Hello
Note right of China: China thinks\nabout it
China-->Andrew: How are you?
Andrew->>China: I am good thanks!
```
### 配置选项

```js
options = {
  // Change the styling of the diagram, typically one of 'simple', 'hand'. New themes can be registered with registerTheme(...).
  theme: string,

  // CSS style to apply to the diagram's svg tag. (Only supported if using snap.svg)
  css_class: string,
}
```

查看更多配置信息请访问 https://bramp.github.io/js-sequence-diagrams/

示例：

    ```sequence
    Title: Here is a title
    A->B: Normal line
    B-->C: Dashed line
    C->>D: Open arrow
    D-->>A: Dashed open arrow
    ```

```sequence
Title: Here is a title
A->B: Normal line
B-->C: Dashed line
C->>D: Open arrow
D-->>A: Dashed open arrow
```
-----

    ```sequence
    # Example of a comment.
    Note left of A: Note to the\n left of A
    Note right of A: Note to the\n right of A
    Note over A: Note over A
    Note over A,B: Note over both A and B
    ```

```sequence
# Example of a comment.
Note left of A: Note to the\n left of A
Note right of A: Note to the\n right of A
Note over A: Note over A
Note over A,B: Note over both A and B
```
-----

## 相关链接

 - 好用的工具 https://www.websequencediagrams.com/
 - JS MarkDown 编辑器 https://stackedit.io/