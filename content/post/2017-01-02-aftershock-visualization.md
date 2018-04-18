---
title: 新西兰地震余震可视化
date: 2017-01-02
lastmod: 2018-04-15
author: Qipeng Bai
categories: 
  - 计算机科学
tags:
  - 地震
  - Python
slug: aftrshock-visualization
---

---
地震学中的可视化工作多种多样，这里我们首先对新西兰地震余震震中随时间演化的可视化给出一个示例。

<!--more-->

Python 具有十分丰富的扩展库来进行可视化工作，例如Matplotlib, Mayavi, VTK等等，这里我们主要关注的是地震学的数据可视化。

### Aftershock

> The smaller aftershocks following a mainshock have a characteristic distribution in size and time. As Fig. 4.5-9, most aftershock occur on or near the mainshock's fault plane, so their location are used to distinguish between the fault and auxiliary planes and to estimate the fault area.
>
> <cite>-- Seth Stein, An Introduction to Seismology Earthquake and Earth Structure </cite>


作为例子，我们先选取 **2016-11-20-M7.8新西兰地震** 作为主震，从`USGS earthquake feed`下载csv格式的余震目录数据，
这里使用了Python3的 `urllib` 包作为获取目录的模块，原始的csv文件是后发生地震在前，为了画出随主震后时间演化的地震，我们将数据从后往前取值。

``` python
import urllib
import numpy as np
import matplotlib
matplotlib.rcParams['toolbar'] = 'None'
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap
#from  matplotlib.animation import FuncAnimation
import matplotlib.animation as animation


# Open the earthquake data
# -------------------------
# -> http://earthquake.usgs.gov/earthquakes/feed/v1.0/csv.php
feed = "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/"

# Significant earthquakes in the past 30 days
# url = urllib.request.urlopen(feed + "significant_month.csv")

# Earthquakes of magnitude > 4.5 in the past 30 days
# url = urllib.request.urlopen(feed + "4.5_month.csv")
url = urllib.request.urlopen(feed + "4.5_week.csv")

# Earthquakes of magnitude > 2.5 in the past 30 days
# url = urllib.request.urlopen(feed + "2.5_month.csv")
# url = urllib.request.urlopen(feed + "2.5_week.csv")

# Earthquakes of magnitude > 1.0 in the past 30 days
# url = urllib.request.urlopen(feed + "1.0_month.csv")

# Set earthquake data
data = url.read()
data = data.split(b'\n')[+1:-1]
E = np.zeros(len(data), dtype=[('position',  float, 2),
                               ('magnitude', float, 1)])
for i in range(len(data)):
    row = data[i].split(b',')
    E['position'][i] = float(row[2]),float(row[1])
    E['magnitude'][i] = float(row[4])


fig = plt.figure()
ax = plt.subplot(1,1,1)
P = np.zeros(50, dtype=[('position', float, 2),
                        ('size',     float, 1),
                        ('growth',   float, 1),
                        ('color',    float, 4)])

# Basemap projection
map = Basemap(projection='mill')
map.drawcoastlines(color='0.40', linewidth=0.25)
map.fillcontinents(color='0.60')
scat = ax.scatter(P['position'][:,0], P['position'][:,1], P['size'], lw=0.5,
                  edgecolors = P['color'], facecolors='None', zorder=10)


def update(frame):
    current = frame % len(E)
    i = frame % len(P)

    P['color'][:,3] = np.maximum(0, P['color'][:,3] - 1.0/len(P))
    P['size'] += P['growth']

    magnitude = E['magnitude'][current]
    P['position'][i] = map(*E['position'][current])
    P['size'][i] = 5
    P['growth'][i]= np.exp(magnitude) * 0.1

    if magnitude < 6:
        P['color'][i]    = 0,0,1,1
    else:
        P['color'][i]    = 1,0,0,1
    scat.set_edgecolors(P['color'])
    scat.set_facecolors(P['color']*(1,1,1,0.25))
    scat.set_sizes(P['size'])
    scat.set_offsets(P['position'])

plt.title("Earthquakes > 4.5 in the last 30 days")
anim = animation.FuncAnimation(fig, update, interval=100)
anim.save('line.gif', dpi=100, writer='imagemagick')
```
演示效果：

<img src="/images/2017-01-02-aftershock-visualization/10km_NewZealand.gif" alt="10km New Zealand aftershock " width="100%" ></img>
