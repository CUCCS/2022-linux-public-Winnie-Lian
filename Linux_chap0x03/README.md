# 实验三
---

## 实验环境
- 本地虚拟机
  - virtualization:oracle
  - operating system:Ubuntu 20.04.3 LTS
  - Kernel:Linux 5.4.0-105-generic
  - architecture:x86-64
- aliyun 云起实验室
  - virtualization:kvm
  - operating system:CentOS Linux 7 
  - Kernel:inux 3.10.0-1062.18.1.el7.
  - Architecture: x86-64 

## 实验要求
- 使用 asciinema 录像学习systemd的过程
- 完成*自查清单*
  - 如何添加一个用户并使其具备sudo执行程序的权限？
  - 如何将一个用户添加到一个用户组？
  - 如何查看当前系统的分区表和文件系统详细信息？
  - 如何实现开机自动挂载Virtualbox的共享目录分区？
  - 基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？
  - 如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？
  - 如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现**杀不死**？
## 实验过程记录
### systemd学习
- overview
 [![Ubentu_20.04.3_LTS-overview](https://asciinema.org/a/oREV8j6eaAQEs5sJjyYsqSGVN.svg)](https://asciinema.org/a/oREV8j6eaAQEs5sJjyYsqSGVN)
 [![Centos-overview](https://asciinema.org/a/Yg0KRtWDkphfls7rdssWD6lYU.svg)](https://asciinema.org/a/Yg0KRtWDkphfls7rdssWD6lYU)

- system management
    > 从这里开始，直接使用tmux，用上下panel进行本地虚拟机（Ubuntu）和云服务器（centos）同时操作，对比学习

    [![system management](https://asciinema.org/a/fHMFNW3jG8nq0ZszLMqX8JjVr.svg)](https://asciinema.org/a/fHMFNW3jG8nq0ZszLMqX8JjVr)

- unit
  [![unit](https://asciinema.org/a/7lOShmjT4xNlr7nbgK2bMwtnM.svg)](https://asciinema.org/a/7lOShmjT4xNlr7nbgK2bMwtnM)

- unit config
  [![unit-cfg](https://asciinema.org/a/jHKa1K6UsZFMOU1VDY6RbT2XZ.svg)](https://asciinema.org/a/jHKa1K6UsZFMOU1VDY6RbT2XZ)

- target
 [![target](https://asciinema.org/a/ho8WsbMA4pKlP45dbt8qrxr6V.svg)](https://asciinema.org/a/ho8WsbMA4pKlP45dbt8qrxr6V)

- log
  [![log](https://asciinema.org/a/6IbmzcQfROhYIhh9MXxp5PSpZ.svg)](https://asciinema.org/a/6IbmzcQfROhYIhh9MXxp5PSpZ)

- auto start
  [![auto-start](https://asciinema.org/a/v58pMQxrao8fM6LwqjEpJQ5TR.svg)](https://asciinema.org/a/v58pMQxrao8fM6LwqjEpJQ5TR)

### 自查清单
- 如何添加一个用户并使其具备sudo执行程序的权限？
  ```bash
    sudo adduser {{username}}
    chmod 4755 {{file}} # 添加SUID位 使其拥有's'的特殊权限 
  ```
- 如何将一个用户添加到一个用户组？
  ```bash
    usermod -G {{groupname}} {{username}}
  ```
- 如何查看当前系统的分区表和文件系统详细信息？
  ```bash
    sudo fdisk -l 
    lsblk -f
  ```
- 如何实现开机自动挂载Virtualbox的共享目录分区？
  ==咱就是说，做了很久，重启之后gitbash崩了，好像第二个视频没录上，我还特意改了改时区，显示一下时间来着，，，反正就是先睡了、、、==
- 基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？
- 如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？
- 如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现**杀不死**？



---

## 问题汇总

---

## reference
- [Change access permissions](https://www.gnu.org/software/coreutils/manual/html_node/chmod-invocation.html#chmod-invocation)
- [chmod](https://www.cnblogs.com/linuxandy/p/10881918.html)

