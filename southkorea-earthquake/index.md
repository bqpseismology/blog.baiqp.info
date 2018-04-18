---
2016-09-12在韩国庆州境内发生两次地震，本文给出 **CAP** 近震的机制解反演结果。

<!--more-->

此反演结果使用的数据来源于 [IRIS M4.9](http://ds.iris.edu/wilber3/find_stations/5192986) [IRIS M5.4] (http://ds.iris.edu/wilber3/find_stations/5192991) ，地震基本信息来源于[USGS M4.9](http://earthquake.usgs.gov/earthquakes/eventpage/us10006p12#executive) [USGS M5.4] (http://earthquake.usgs.gov/earthquakes/eventpage/us10006p1f#executive)。

## 1. 地震速报
***NEWS***

【正式测定：韩国庆州4.9级和5.4级地震】USGS正式测定：2016-09-12在韩国庆州境内发生两次地震，M4.9级震源深度10.0km，M5.4级震源深度10.0km。  

***SCIENTIFIC*** 
**Neic earthquake location information:**  
Magnitude: 5.4 Mb ±0.0
Location: 35.769°N 129.227°E ±4.9km  
Depth: 10.0 km ±1.8  
Origin Time: 2016-09-12 11:32:54.940 UTC  

**USGS moment tensors**  

<img src="/images/2016-09-12-SouthKorea-earthquake/USGS_Moment_Tensors.png" alt="USGS_Moment_Tensors.png" width="40%" ><img src="/images/2016-09-12-SouthKorea-earthquake/Centroid_Moment_Tensor.png" alt="Centroid_Moment_Tensor.png" width="100%" >

## 2. CAPloc 机制解 ##

#### M4.9 ####

**Crust1.0 CAPloc反演结果:**   
{{% left %}}
![CAPloc_2016-09-12_M4.9_Sou定：韩国庆州4.9级和5.4级地震】USGS正式测定：2016-09-12在韩国庆州境thKorea_mecherr.png](/images/2016-09-12-southkorea-earthquake/CAPloc_2016-09-12_M4.9_SouthKorea_mecherr.png) 
{{% left %}}
{{% right %}}
![](/images/2016-09-12-southkorea-earthquake/CAPloc_2016-09-12_M4.9_SouthKorea_vmodel_22.png)
{{% right %}}

**[(Kim et al., 1999)](https://www.researchgate.net/profile/Nadia_Kraeva/publication/264083188_Source_Parameter_Determination_of_Local_Earthquakes_in_Korea_Using_Moment_Tensor_Inversion_of_Single_Station_Data/links/54d8fe0f0cf24647581d2814.pdf) 文章中model C 速度模型CAPloc反演结果:**   
<img src="/images/2016-09-12-SouthKorea-earthquake/CAPloc_2016-09-12_M4.9_SouthKorea_OldModel_mecherr.png" alt="CAPloc_2016-09-12_M4.9_SouthKorea_OldModel_mecherr.png" width="40%" ><img src="/images/2016-09-12-SouthKorea-earthquake/CAPloc_2016-09-12_M4.9_SouthKorea_OldModel_vmodel_30.png" alt="CAPloc_2016-09-12_M4.9_SouthKorea_OldModel_vmodel_30.png" width="40%" >

**Crust1.0 gCAPloc反演结果:**  
<img src="/images/2016-09-12-SouthKorea-earthquake/gCAPloc_2016-09-12_M4.9_SouthKorea_mecherr.png" alt="gCAPloc_2016-09-12_M4.9_SouthKorea_mecherr.png" width="40%" ><img src="/images/2016-09-12-SouthKorea-earthquake/gCAPloc_2016-09-12_M4.9_SouthKorea_vmodel_18.png" alt="gCAPloc_2016-09-12_M4.9_SouthKorea_vmodel_18.png" width="40%" >

#### M5.4 ####

**Crust1.0 CAPloc<img src="/images/2016-09-12-SouthKorea-earthquake/CAPloc_2016-09-12_M5.4_SouthKorea_allSta_mecherr.png" alt="CAPloc_2016-09-12_M5.4_SouthKorea_allSta_mecherr.png" width="40%" ><img 全台站反演结果:**   
<img src="/images/2016-09-12-SouthKorea-earthquake/CAPloc_2016-09-12_M5.4_SouthKorea_allSta_mecherr.png" alt="CAPloc_2016-09-12_M5.4_SouthKorea_allSta_mecherr.png" width="40%" ><img src="/images/2016-09-12-SouthKorea-earthquake/CAPloc_2016-09-12_M5.4_SouthKorea_allSta_vmodel_25.png" alt="CAPloc_2016-09-12_M5.4_SouthKorea_allSta_vmodel_25.png" width="40%" >

**Crust1.0 CAPloc挑选通道后反演结果:**  
<img src="/images/2016-09-12-SouthKorea-earthquake/CAPloc_2016-09-12_M5.4_SouthKorea_mecherr.png" alt="CAPloc_2016-09-12_M5.4_SouthKorea_mecherr.png" width="40%" ><img src="/images/2016-09-12-SouthKorea-earthquake/CAPloc_2016-09-12_M5.4_SouthKorea_vmodel_28.png" alt="CAPloc_2016-09-12_M5.4_SouthKorea_vmodel_28.png" width="40%" >

**Crust1.0 gCAPloc全台站反演结果:**  
<img src="/images/2016-09-12-SouthKorea-earthquake/gCAPloc_2016-09-12_M5.4_SouthKorea_allSta_mecherr.png" alt="gCAPloc_2016-09-12_M5.4_SouthKorea_allSta_mecherr.png" width="40%" ><img src="/images/2016-09-12-SouthKorea-earthquake/gCAPloc_2016-09-12_M5.4_SouthKorea_allSta_vmodel_25.png" alt="gCAPloc_2016-09-12_M5.4_SouthKorea_allSta_vmodel_25.png" width="40%" >

**Crust1.0 gCAPloc挑选通道反演结果:**  
<img src="/images/2016-09-12-SouthKorea-earthquake/gCAPloc_2016-09-12_M5.4_SouthKorea_mecherr.png" alt="gCAPloc_2016-09-12_M5.4_SouthKorea_mecherr.png" width="40%" ><img src="/images/2016-09-12-SouthKorea-earthquake/gCAPloc_2016-09-12_M5.4_SouthKorea_vmodel_25.png" alt="gCAPloc_2016-09-12_M5.4_SouthKorea_vmodel_25.png" width="40%" >

-----
&copy; USTC 白起鹏 <baiqp@mail.ustc.edu.cn>
