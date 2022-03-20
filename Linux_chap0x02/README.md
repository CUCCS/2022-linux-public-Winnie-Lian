### Linux_chap0x02

---

### 实验过程录屏
#### Ubuntu
1. 【软件包管理】在目标发行版上安装 tmux 和 tshark ；查看这 2 个软件被安装到哪些路径；卸载 tshark ；验证 tshark 卸载结果
   [![asciicast](https://asciinema.org/a/JaB4epjVCp4d3edKdtHNFkL7J.svg)](https://asciinema.org/a/JaB4epjVCp4d3edKdtHNFkL7J)


2. 找到 /tmp 目录及其所有子目录下，文件名包含 666 的所有文件
   找到 /tmp 目录及其所有子目录下，文件内容包含 666 的所有文件
   [![Ubuntu-20.04.3-LTS-find_the_specific_file](https://asciinema.org/a/SOORhONJ8l3wIkLPGzBUgeMyx.svg)](https://asciinema.org/a/SOORhONJ8l3wIkLPGzBUgeMyx)

3. 文件压缩与解压缩】练习课件中 文件压缩与解压缩 一节所有提到的压缩与解压缩命令的使用方法
[![ubuntu-20.04-LTS-compress_files](https://asciinema.org/a/WeRjng7AJOAsEr4LzA1s91zNg.svg)](https://asciinema.org/a/WeRjng7AJOAsEr4LzA1s91zNg)

4. 【跟练】 子进程管理实验
   [![ubuntu-20.04-processing](https://asciinema.org/a/lFyLQQC6PRfaxJzi4gcb8VIhJ.svg)](https://asciinema.org/a/lFyLQQC6PRfaxJzi4gcb8VIhJ)


5. 【硬件信息获取】目标系统的 CPU、内存大小、硬盘数量与硬盘容量
   [![ubuntu-20.04-physical_device](https://asciinema.org/a/1NM2UbasXFTICPdWq22vt8BMl.svg)](https://asciinema.org/a/1NM2UbasXFTICPdWq22vt8BMl)


#### Centos
1. 【软件包管理】在目标发行版上安装 tmux 和 tshark ；查看这 2 个软件被安装到哪些路径；卸载 tshark ；验证 tshark 卸载结果
  [![centos-install&remove](https://asciinema.org/a/DxTT5bOtql99s4rphxGou4DMt.svg)](https://asciinema.org/a/DxTT5bOtql99s4rphxGou4DMt)


2. 找到 /tmp 目录及其所有子目录下，文件名包含 666 的所有文件
   找到 /tmp 目录及其所有子目录下，文件内容包含 666 的所有文件
[![Centos-find_specific_files](https://asciinema.org/a/jXwn9jnR7eqA5ibtRLeD7ERlV.svg)](https://asciinema.org/a/jXwn9jnR7eqA5ibtRLeD7ERlV)

3. 文件压缩与解压缩】练习课件中 文件压缩与解压缩 一节所有提到的压缩与解压缩命令的使用方法
[![Centos-compress_files](https://asciinema.org/a/gjmuNwObiI0YIyljrgabJMbMl.svg)](https://asciinema.org/a/gjmuNwObiI0YIyljrgabJMbMl)

4. 【跟练】 子进程管理实验
[![centos-processing](https://asciinema.org/a/Bq3pnIH69dSBFPbHOw5Bgq37B.svg)](https://asciinema.org/a/Bq3pnIH69dSBFPbHOw5Bgq37B)


5. 【硬件信息获取】目标系统的 CPU、内存大小、硬盘数量与硬盘容量
[![Centos-physical_device](https://asciinema.org/a/RN1IsSRa8fJ5hwVdMotAawn3i.svg)](https://asciinema.org/a/RN1IsSRa8fJ5hwVdMotAawn3i)

---

### 实验问题与总结
- ==提问==：自己看录屏的时候，嘶...可能不只是录屏，包括上课，在没有实验之前，事实上并没有记得很清楚，过程中一直在查找文档，这样是合理的吗、、、*（就是得到了“渔”的话，“鱼”这个事儿可以就是...慢慢来吗 :sweat:)* 就是感觉全部记下来脑子一时搞不定呢 :sob:)
- 查询asciinema官网发现没有支持阿里云实验环境提供的centos系统，经过“各位老师”的帮助，找到解决方案
  - 本地虚拟机（Ubuntu）进行录屏，利用ssh连接云服务器（centos），然后再进行操作
  - 同时本地虚拟机已由宿主机（windows）配置好免密登录，所以大胆猜测，这玩意可以一直一直连接下去，通过一台连接一台连接一台连接一台
    - 那么有一个==小疑惑==：就是那么免密登录本身还是没那么安全吧，虽然rsa本身是相对安全的，但是如果是一串连接，岂不是一旦一台攻破，一串都没了