## 归一化
[URL](https://mp.weixin.qq.com/s?__biz=MzI1Njk4ODE0MQ==&mid=2247514572&idx=1&sn=8a98b4713d693a66b1370e1c4e72db62&chksm=ea1cbf4edd6b3658102baeeb6c9d18b84cb008a10eeae85fa1e13c3d468ea65f7604bba5f4c4&cur_album_id=3043199957647917063&scene=190#rd)

* 移位对数变换有利于稳定方差, 以利于后续降维和差异基因的识别
* 皮尔森近似残差可以保留生物学差异, 并鉴定稀有细胞类型

## 特征基因选择
mapping后, 会得到30,000 到 50,000 不等的基因, 一个细胞表达的基因
大约是3,000个左右. 这意味着一大部分基因可能不具有与单细胞数据相关
的生物学意义, 因此需要计算高可变基因 (特征基因)

* 基于基因离散度
* 基于基因归一化方差
* 基于基因的皮尔斯残差

## 聚类
单细胞测序数据经过预处理后, 下一步是在数据集中识别细胞结构

我们一般认为不同种类的细胞具有不通的细胞结构,我们可以将相似
的细胞聚类到一起, 进而寻找相似的细胞中的共同特征, 如: 共同表
达的基因, 细胞的基因分布. 我们基于细胞的共同特征, 为细胞赋予
不同的身份. 寻找相似的细胞结构的过程被称为**聚类**

**KNN 邻域图**

## 细胞类型注释
(url)[https://zhuanlan.zhihu.com/p/649082596]

不同的细胞, 其RNA-seq数据是不一样的. 希望能弄清楚, 这10,000个细胞
究竟都是什么细胞. 可以一次测得很多细胞的RNA-seq数据, 我们
获得每一个细胞的身份的过程被称为"细胞类型注释"

在生物学上,不同的细胞具有不同的表型,细胞的表面抗原,或者特定
的表达基因会有所区别, **细胞类型**

细胞类型的注释并不是绝对的,我们一般会首先获得大类细胞,再
从大类细胞中识别细胞类型的"亚型"或"细胞状态"

注释一般分为两步: 细胞主要类型注释 -> 细胞亚群注释

准备一个细胞marker字典 ->

#### 基于 marker 字典的注释
标记基因集

循环遍历所有marker字典里的细胞类型, 并仅保留我们在
adata对象中发现的基因作为该细胞类型的标记基因 

#### 基于簇特异性 marker 基因的注释
更多的细胞是没有已知的marker基因的, 这时候我们该怎么进行注释呢

我们可以计算每个簇的标记基因, 然后查找是否可以将这些
标记基因与任何已知的生物学 (例如细胞类型和/或状态) 联系起来. 
我们一般会使用t-test或者秩和检验来计算不同簇的差异表达基因

#### 基于 marker 数据库的注释


## 差异表达基因分析
[url](https://zhuanlan.zhihu.com/p/675912947)
讲解了单细胞数据的差异表达基因分析方法, 详细对比了ttest与DEseq2
在所有细胞进行差异表达分析的异同, 以及为什么要使用元细胞分析的原因

为了解决单细胞稀疏性与样本过大的问题, 我们可以采用一种叫做伪
Bulk(pseudo-bulk) 的方法来聚合单细胞数据, 从而进行差异表达分析

https://www.proteinatlas.org/
