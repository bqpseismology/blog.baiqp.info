-----
使用 `Hugo` 编译后的静态博客，在 `GitHub Pages` 上发布，可以直接在 `https://username.github.io` 查看。当然一些人想使用自定义域名，可以通过 [Godaddy](https://sg.godaddy.com/zh) 申请一个域名。

<!--more-->

申请域名后，可以通过将域名和`GitHub`的仓库绑定，则`GitHub Pages`的网页域名解析为自定义域名。具体做法如下，进入DNS管理，修改记录如下：

| 类型           |      名称     |       值                  |   TTL      |
|:--------------|:--------------|:-------------------------|:------------|
| A             |       @       |  192.30.252.153          | 1小时       |
| CNAME         |       www     | bqpseismology.github.io  |  1小时      |
| ...           |               |                          |             |

**访问我的博客，[请戳这里](http://baiqp.info)** 

-----

**:heavy_exclamation_mark: 注意：**

- 不要使用默认的CNAME的记录，将默认的删去，否则会影响`GithHub Pages`的正确解析。
- 使用 `http://` 访问，使用 `https://` 访问会出现错误。

-----

### 链接：

- [GoDaddy](https://account.godaddy.com/products/#/)
- [GitHub](https://github.com)