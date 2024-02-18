[source](https://mp.weixin.qq.com/s/tR_rOniEfMdCq3i-iDijUQ)

## 文库基本结构组成
- Cell barcode： 代表细胞的身份
- UMI：          Unique Molecular Indentifie, 代表来自同一个mRNA片段, 反转录成cDNA后,
                 当检测到两个或多个cDNA带有相同的UMI, 只能计数为counts = 1
                 避免PCR扩增和检测精度带来的误差
- cDNA:          即实际的mRNA序列, 包含基因信息
- 10X:           Read1 = Cell barcode + UMI, Read2 = cDNA


## whitelist
虽然10X v2和v3的Cell barcode序列都是16个碱基
但他们其实还是有很大区别, 其中最大区别是whitelist, 即白名单

**为什么需要白名单**
只有在白名单内的barcode才能被识别并进行分析
不同的10X protocol 对应不同的 whitelist

