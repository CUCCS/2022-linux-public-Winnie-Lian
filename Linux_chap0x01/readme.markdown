## chap0x01 
homework requirements:
 ![hw_requirement](hw_requirement.png)

#### 如何配置SSH免密登录
选用自己下载安装的ubentu，由于客机增强件因不明原因尚未安装成功，且黄玮老师也表示完全没有必要，所以决定先解决一下最后一个问题，完成连接（同时就把免密登录搞定）

- 首先打开自己配置的虚拟机 
   ![ubentu_boot](ubentu_boot.png)

  成功登录(这三分钟主要用于...忘记了密码... :joy:)
   ![successful_login](successful_login.png)
  
- 先尝试找到ubentu的ip
  ```
  ifconfig
  ```
  - 得到了反馈与上课演示相同，‘ifconfig'已经取消，但给到了解决方案
  ![find_my_ip](find_my_ip.png)
  
  根据解决方案下载工具
  ```
  sudo install net-tools
  ```
  screenshoot of successful installing :point_down:
  ![install_net-tool](install_net-tool.png)

  紧接着成功获取ip:
  ![get_ip](get_ip.png)

- 尝试连接
    - 第一次尝试，显然失败，因为不知道在想啥，密码都没有怎么可能...:joy:
   ![](ssh_firstTry.png)
    - 第二次尝试
          -  先看了一下帮助文档
            ![ssh_help](ssh_help.png)  
          -  记得原来配置过密钥对，先寻找一下，确定有没有
            ![check_keys](check_keys.png)   
            
        发现了个问题就是，在这个默认生成的.ssh文件夹下，我的公私钥对和她想要的好像有出入，根据报错信息来看，显然是有相应的密钥的，但我这边的应该是 *private* & *public_key*
        ![prob_pK](prob_pK.png)
        原本是找到有相应的文件就以为可以使用，但根据报错的情况来看，他会自动加上 *‘.pub’* 的后缀

        目前严重怀疑这个公私钥对是在anjing的课上用‘puttygen’生成的，似乎有一定的出入（似乎之前有远程登录其他主机的时候也发现了这个问题，但记不太清了....）

        于是，手动查找了一下我本地的密码到底是什么情况。
        ![find_ssh](find_ssh.png)
        ![ssh_unuseful](ssh_unuseful.png)
        想要尝试另一个，打开config后发现，好像是之前用过的，配置过的内容，所以决定重新生成
        ![ssh-keygen](ssh-keygen.png)

        然后再一次失败。
        ![](ssh-copy-id_failure.png)
        看起来，像是上一次成功的copy了？他提到了'new keys' 但我需要确认一下

        查询一些解决方案
        1. 端口有问题，虽然没有说明到底为什么，但可以一试？https://www.cnblogs.com/chuyiwang/p/10729591.html
            ![](changePort.png)

        2. 也有说是因为防火墙没有关闭，尝试相关命令，可能因为版本不同，并没有成功（暂且放着一下）
        3. 自己直接ping了一下虚拟机，发现也不行，根据这篇帖子，了解相关内容，但我的配置按照上课演示应该没 https://blog.csdn.net/weixin_38044597/article/details/106478977


这里记录一下过程 
发现10.0几的有问题，是nat分配的
发现hostonly分配ip似乎有问题
发现防火墙是关闭了的




            
http://manpages.ubuntu.com/manpages/bionic/man8/ufw.8.html?_ga=2.85812377.1242763031.1646741474-2081316074.1645407211