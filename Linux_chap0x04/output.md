# image process
```bash
ssh winnie
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.4.0-109-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Fri 22 Apr 2022 08:44:43 AM UTC

  System load:  0.07               Processes:               146
  Usage of /:   42.1% of 18.57GB   Users logged in:         0
  Memory usage: 52%                IPv4 address for enp0s3: 10.0.2.15
  Swap usage:   0%                 IPv4 address for enp0s8: 192.168.56.103

 * Super-optimized for small spaces - read how we shrank the memory
   footprint of MicroK8s to make it the smallest full K8s around.

   https://ubuntu.com/blog/microk8s-memory-optimisation

59 updates can be applied immediately.
To see these additional updates run: apt list --upgradable


Last login: Fri Apr 22 08:30:27 2022 from 192.168.56.1
winnie@winnie:~$ sudo apt update && install asciinema
[sudo] password for winnie:
Hit:1 http://cn.archive.ubuntu.com/ubuntu focal InRelease
Get:2 http://cn.archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
winnie@winnie:~$ asciinema rec -t img_process
asciinema: recording asciicast to /tmp/tmp5j7uepnf-ascii.cast
asciinema: press <ctrl-d> or type "exit" when you're done
winnie@winnie:~$ ls  task1_img/
0.jpeg  10.png  12.png  14.png  1.jpeg  2.png  4.png  6.png  8.png
0.png   11.png  13.png  15.png  1.png   3.png  5.png  7.png  9.png
winnie@winnie:~$ bash process_image.sh
process_image is a ____ that qcan batch image files in all support formats in the specified directory
Usage:./process_image.sh [OPTITIONS]
-r,--rename [path] -p,--prefix [text]\-s,--suffix [text]               Batch rename all the images in the specified directory
-c,--compress [path]                                                   Compress the image
-co [path]                                                             Compress the image with the original height:width
-w,--watermark [path] [text of watermark]                              Add a custom text watermark to the picture batch
-t,--transform [path]                                                  Transform image into JPEG
-h,--help                                                              Display this help page
======================= the output will be in the '.\res\' directory in default ================================
winnie@winnie:~$ bash process_image.sh -h
process_image is a ____ that qcan batch image files in all support formats in the specified directory
Usage:./process_image.sh [OPTITIONS]
-r,--rename [path] -p,--prefix [text]\-s,--suffix [text]               Batch rename all the images in the specified directory
-c,--compress [path]                                                   Compress the image
-co [path]                                                             Compress the image with the original height:width
-w,--watermark [path] [text of watermark]                              Add a custom text watermark to the picture batch
-t,--transform [path]                                                  Transform image into JPEG
-h,--help                                                              Display this help page
======================= the output will be in the '.\res\' directory in default ================================
winnie@winnie:~$ bash process_image.sh -r task1_img -p pr_
winnie@winnie:~$ ls  task1_img/
pr__0.jpeg  pr__10.png  pr__12.png  pr__14.png  pr__1.jpeg  pr__2.png  pr__4.png  pr__6.png  pr__8.png
pr__0.png   pr__11.png  pr__13.png  pr__15.png  pr__1.png   pr__3.png  pr__5.png  pr__7.png  pr__9.png
winnie@winnie:~$ bash process_image.sh -r task1_img -s -done
winnie@winnie:~$ ls  task1_img/
pr__0_-done.jpeg  pr__11_-done.png  pr__14_-done.png  pr__1_-done.png  pr__4_-done.png  pr__7_-done.png
pr__0_-done.png   pr__12_-done.png  pr__15_-done.png  pr__2_-done.png  pr__5_-done.png  pr__8_-done.png
pr__10_-done.png  pr__13_-done.png  pr__1_-done.jpeg  pr__3_-done.png  pr__6_-done.png  pr__9_-done.png
winnie@winnie:~$ bash process_image.sh -c task1_img/pr__0_-done.jpeg
winnie@winnie:~$ ls -r task1_img/
res              pr__6_-done.png  pr__2_-done.png   pr__14_-done.png  pr__10_-done.png
pr__9_-done.png  pr__5_-done.png  pr__1_-done.png   pr__13_-done.png  pr__0_-done.png
pr__8_-done.png  pr__4_-done.png  pr__1_-done.jpeg  pr__12_-done.png  pr__0_-done.jpeg
pr__7_-done.png  pr__3_-done.png  pr__15_-done.png  pr__11_-done.png
winnie@winnie:~$ ls task1_img/res/
pr__0_-done.jpeg
winnie@winnie:~$ bash process_image.sh -co task1_img/pr__1_-done.jpeg
winnie@winnie:~$ ls task1_img/res/
pr__0_-done.jpeg  pr__1_-done.jpeg
winnie@winnie:~$ bash process_image.sh -w task1_img SECURITY
convert-im6.q16: no decode delegate for this image format `' @ error/constitute.c/ReadImage/560.
convert-im6.q16: no images defined `task1_img/res/res' @ error/convert.c/ConvertImageCommand/3258.
winnie@winnie:~$ ls task1_img/res
pr__0_-done.jpeg  pr__11_-done.png  pr__14_-done.png  pr__1_-done.png  pr__4_-done.png  pr__7_-done.png
pr__0_-done.png   pr__12_-done.png  pr__15_-done.png  pr__2_-done.png  pr__5_-done.png  pr__8_-done.png
pr__10_-done.png  pr__13_-done.png  pr__1_-done.jpeg  pr__3_-done.png  pr__6_-done.png  pr__9_-done.png
winnie@winnie:~$ bash process_image.sh -t task1_img
process_image.sh: line 96: transform: command not found
winnie@winnie:~$ bash process_image.sh -t task1_img
winnie@winnie:~$ ls task1_img/res
pr__0_-done.jpeg   pr__12_-done.jpeg  pr__15_-done.jpeg  pr__3_-done.jpeg  pr__6_-done.jpeg  pr__9_-done.jpeg
pr__0_-done.png    pr__12_-done.png   pr__15_-done.png   pr__3_-done.png   pr__6_-done.png   pr__9_-done.png
pr__10_-done.jpeg  pr__13_-done.jpeg  pr__1_-done.jpeg   pr__4_-done.jpeg  pr__7_-done.jpeg
pr__10_-done.png   pr__13_-done.png   pr__1_-done.png    pr__4_-done.png   pr__7_-done.png
pr__11_-done.jpeg  pr__14_-done.jpeg  pr__2_-done.jpeg   pr__5_-done.jpeg  pr__8_-done.jpeg
pr__11_-done.png   pr__14_-done.png   pr__2_-done.png    pr__5_-done.png   pr__8_-done.png
winnie@winnie:~$ exit
asciinema: recording finished
asciinema: press <enter> to upload to asciinema.org, <ctrl-c> to save locally

View the recording at:

    https://asciinema.org/a/ZYrSMNFC01kYSYHwFDHHEbe10

winnie@winnie:~$

```

--- 

# data analyze
```bash
winnie@winnie:~$ asciinema rec -t data_analyze
asciinema: recording asciicast to /tmp/tmpqki233sv-ascii.cast
asciinema: press <ctrl-d> or type "exit" when you're done
winnie@winnie:~$ bash data_analyze.sh
data analyze is a script that tackle with the information of the athletes in 2014 World Cup
Usage:./data_analyze.sh [OPTITIONS]
-a [[low:high]](eg. [0:20] refers to under 20 years)          give the number and percentage of the range
-p [positon]                                                  give the number and percentage of the specific position
-l                                                            give the longest name
-s                                                            give the shortest name
-e                                                            give the eldest athlete
-y                                                            give the yongest athlete
winnie@winnie:~$ bash data_analyze.sh -a [20:24]

================= age_range called ===================
the number of the athletes whose age is between 20 and 24.000000 is 209
the percentage of the group is 28.36%
================= age_range end ===================

winnie@winnie:~$ bash data_analyze.sh -a [20:30]

================= age_range called ===================
the number of the athletes whose age is between 20 and 30.000000 is 600
the percentage of the group is 81.41%
================= age_range end ===================

winnie@winnie:~$ bash data_analyze.sh -a [40:50]

================= age_range called ===================
the number of the athletes whose age is between 40 and 50.000000 is 1
the percentage of the group is 0.14%
================= age_range end ===================

winnie@winnie:~$ bash data_analyze.sh -p Defender

****************** get_postion called ******************
the number of the athletes whose position is Defender is 236
the percentage of the group is 32.02%
 ****************** get_postion end ******************

winnie@winnie:~$ bash data_analyze.sh -l

------------------- longest_name called -------------------
Since the awk takes the unicode as auto, the string length is orderedby the character.
the longest name of character is Francisco Javier Rodriguez
 ------------------- longest_name end -------------------

winnie@winnie:~$ bash data_analyze.sh -s

------------------- shortest_name called -------------------
Since the awk takes the unicode as auto, the string length is orderedby the character.
the longest name of character is Jô
 ------------------- longest_name end -------------------

winnie@winnie:~$ bash data_analyze.sh -e

#################### find_eldest called ####################
the eldest player is 0-year-old Player
#################### find_eldest end ####################
winnie@winnie:~$ bash data_analyze.sh -y

#################### find_yongest called ####################
the yongest player is 18-year-old Fabrice Olinga
#################### find_yongest end ####################
winnie@winnie:~$ exit
asciinema: recording finished
asciinema: press <enter> to upload to asciinema.org, <ctrl-c> to save locally


View the recording at:

    https://asciinema.org/a/buPTzhceCDZJTB8FzldTKEIgm

winnie@winnie:~$

```

--- 

# log process
```bash
winnie@winnie:~$ asciinema rec -t log_process
asciinema: recording asciicast to /tmp/tmpyx442m37-ascii.cast
asciinema: press <ctrl-d> or type "exit" when you're done
winnie@winnie:~$ bash log_process.sh
--2022-04-22 09:29:48--  https://c4pr1c3.github.io/LinuxSysAdmin/exp/chap0x04/web_log.tsv.7z
Resolving c4pr1c3.github.io (c4pr1c3.github.io)... 185.199.109.153, 185.199.111.153, 185.199.108.153, ...
Connecting to c4pr1c3.github.io (c4pr1c3.github.io)|185.199.109.153|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 11760144 (11M) [application/x-7z-compressed]
Saving to: ‘web_log.tsv.7z.3’

web_log.tsv.7z.3              100%[===============================================>]  11.21M  1.41MB/s    in 22s

2022-04-22 09:30:13 (512 KB/s) - ‘web_log.tsv.7z.3’ saved [11760144/11760144]

log_process.sh: line 66: 7z: command not found
log_process is a script that tackle with the logs
Usage:./log_process.sh [OPTITIONS]
-a                                                            get the TOP100 host and the times
-p                                                            get the TOP100 IP and the times
-l                                                            get the TOP100 url and the times
-s                                                            get the code and the times
-y                                                            get the 4xx code and.....
-e [url]                                                      get the TOP100 host of the specific url
winnie@winnie:~$ bash log_process.sh -a
统计访问来源主机TOP 100和分别对应出现的总次数
6530    edams.ksc.nasa.gov
4846    piweba4y.prodigy.com
4791    163.206.89.4
4607    piweba5y.prodigy.com
4416    piweba3y.prodigy.com
3889    www-d1.proxy.aol.com
3534    www-b2.proxy.aol.com
3463    www-b3.proxy.aol.com
3423    www-c5.proxy.aol.com
3411    www-b5.proxy.aol.com
3407    www-c2.proxy.aol.com
3404    www-d2.proxy.aol.com
3337    www-a2.proxy.aol.com
3298    news.ti.com
3296    www-d3.proxy.aol.com
3293    www-b4.proxy.aol.com
3272    www-c3.proxy.aol.com
3234    www-d4.proxy.aol.com
3177    www-c1.proxy.aol.com
3134    www-c4.proxy.aol.com
3123    intgate.raleigh.ibm.com
3088    www-c6.proxy.aol.com
3041    www-a1.proxy.aol.com
3011    mpngate1.ny.us.ibm.net
2983    e659229.boeing.com
2957    piweba1y.prodigy.com
2906    webgate1.mot.com
2761    www-relay.pa-x.dec.com
2318    beta.xerox.com
2311    poppy.hensa.ac.uk
2237    vagrant.vf.mmc.com
1910    palona1.cns.hp.com
1793    www-proxy.crl.research.digital.com
1762    koriel.sun.com
1681    derec
1637    trusty.lmsc.lockheed.com
1623    gw2.att.com
1563    cliffy.lfwc.lockheed.com
1503    inet2.tek.com
1485    disarray.demon.co.uk
1467    gw1.att.com
1435    128.217.62.1
1395    interlock.turner.com
1360    163.205.1.19
1354    sgigate.sgi.com
1336    bocagate.bocaraton.ibm.com
1324    piweba2y.prodigy.com
1311    gw3.att.com
1310    keyhole.es.dupont.com
1297    n1144637.ksc.nasa.gov
1292    163.205.3.104
1256    163.205.156.16
1252    163.205.19.20
1216    erigate.ericsson.se
1211    gn2.getnet.com
1089    gwa.ericsson.com
1079    tiber.gsfc.nasa.gov
1054    128.217.62.2
1017    bstfirewall.bst.bls.com
1015    163.206.137.21
1013    spider.tbe.com
1010    gatekeeper.us.oracle.com
995     www-c8.proxy.aol.com
984     whopkins.sso.az.honeywell.com
966     news.dfrc.nasa.gov
949     128.159.122.110
940     proxy0.research.att.com
925     proxy.austin.ibm.com
902     www-c9.proxy.aol.com
901     bbuig150.unisys.com
899     corpgate.nt.com
890     sahp315.sandia.gov
869     amdext.amd.com
848     128.159.132.56
830     n1121796.ksc.nasa.gov
825     igate.uswest.com
819     gatekeeper.cca.rockwell.com
815     wwwproxy.sanders.com
814     gw4.att.com
812     goose.sms.fi
808     128.159.144.83
805     jericho3.microsoft.com
798     128.159.111.141
786     jericho2.microsoft.com
782     sdn_b6_f02_ip.dny.rockwell.com
778     lamar.d48.lilly.com
776     163.205.11.31
772     heimdallp2.compaq.com
771     stortek1.stortek.com
762     163.205.16.75
759     mac998.kip.apple.com
742     tia1.eskimo.com
733     www-e1f.gnn.com
718     www-b1.proxy.aol.com
715     reddragon.ksc.nasa.gov
711     128.159.122.137
701     rmcg.cts.com
701     bambi.te.rl.ac.uk
697     electron.mcc.com
691     163.205.23.76
sort: write failed: 'standard output': Broken pipe
sort: write error
============= end ===================
winnie@winnie:~$ bash log_process.sh -h
log_process is a script that tackle with the logs
Usage:./log_process.sh [OPTITIONS]
-a                                                            get the TOP100 host and the times
-p                                                            get the TOP100 IP and the times
-l                                                            get the TOP100 url and the times
-s                                                            get the code and the times
-y                                                            get the 4xx code and.....
-e [url]                                                      get the TOP100 host of the specific url
winnie@winnie:~$ bash log_process.sh -p
统计访问来源主机TOP 100 IP和分别对应出现的总次数
4791    163.206.89.4
1435    128.217.62.1
1360    163.205.1.19
1292    163.205.3.104
1256    163.205.156.16
1252    163.205.19.20
1054    128.217.62.2
1015    163.206.137.21
949     128.159.122.110
848     128.159.132.56
808     128.159.144.83
798     128.159.111.141
776     163.205.11.31
762     163.205.16.75
711     128.159.122.137
691     163.205.23.76
672     206.27.25.1
647     198.83.19.44
641     199.1.50.225
624     163.205.23.93
610     139.169.174.102
600     163.205.121.3
598     140.229.116.37
591     141.102.82.127
586     163.206.140.4
573     163.206.104.34
567     204.62.245.32
565     128.159.122.38
563     128.217.62.224
563     128.159.122.107
553     128.159.122.180
549     128.159.123.58
544     163.205.154.11
532     192.112.22.119
518     163.205.16.100
503     199.201.186.103
503     128.159.146.40
494     128.159.122.160
486     192.77.40.4
482     193.143.192.106
480     152.163.192.5
478     163.205.23.71
475     139.169.30.50
469     128.159.122.144
466     163.234.140.22
463     163.205.150.22
457     128.217.61.184
451     163.205.23.72
448     198.83.19.40
446     128.159.122.14
443     199.201.186.104
443     198.83.19.47
443     128.217.61.15
441     128.159.121.34
438     128.159.121.41
435     160.205.119.27
432     163.205.154.17
432     152.163.192.38
432     128.159.122.15
423     128.159.135.73
423     128.159.135.38
421     152.163.192.35
415     128.159.76.128
413     152.163.192.71
412     128.159.63.159
409     163.205.12.100
404     133.53.64.33
402     152.163.192.70
397     128.159.121.64
396     129.239.68.160
391     152.163.192.36
389     163.205.16.90
389     128.32.196.94
385     163.205.1.18
384     163.206.136.1
383     147.147.191.43
374     163.205.16.104
374     152.163.192.69
373     193.178.53.180
371     128.217.63.27
367     130.110.74.81
366     204.69.0.27
365     163.206.130.46
359     152.163.192.67
357     163.205.54.76
356     152.163.192.7
354     198.83.19.43
350     128.159.137.43
348     147.74.110.61
345     163.205.23.44
343     128.159.168.162
336     158.27.59.88
336     152.163.192.3
335     163.205.166.15
335     128.159.145.21
332     163.205.2.180
329     128.217.61.98
328     152.163.192.66
324     163.205.3.38
324     163.205.2.35
sort: write failed: 'standard output': Broken pipe
sort: write error
============= end ===================
winnie@winnie:~$ bash log_process.sh -h
log_process is a script that tackle with the logs
Usage:./log_process.sh [OPTITIONS]
-a                                                            get the TOP100 host and the times
-p                                                            get the TOP100 IP and the times
-l                                                            get the TOP100 url and the times
-s                                                            get the code and the times
-y                                                            get the 4xx code and.....
-e [url]                                                      get the TOP100 host of the specific url
winnie@winnie:~$ bash log_process.sh -s ^C
winnie@winnie:~$ bash log_process.sh -s
统计不同响应状态码的出现次数和对应百分比
1398987 200     89.1139%
134146  304     8.5449%
26497   302     1.6878%
10055   404     0.6405%
171     403     0.0109%
27      501     0.0017%
3       500     0.0002%
winnie@winnie:~$ bash log_process.sh -y
分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
404     1337    /pub/winvn/readme.txt
404     1185    /pub/winvn/release.txt
404     683     /shuttle/missions/STS-69/mission-STS-69.html
404     319     /images/nasa-logo.gif
404     253     /shuttle/missions/sts-68/ksc-upclose.gif
404     209     /elv/DELTA/uncons.htm
404     200     /history/apollo/sa-1/sa-1-patch-small.gif
404     166     /://spacelink.msfc.nasa.gov
404     160     /images/crawlerway-logo.gif
404     154     /history/apollo/a-001/a-001-patch-small.gif
sort: write failed: 'standard output': Broken pipe
sort: write error
winnie@winnie:~$ bash log_process.sh -e
给定URL输出TOP 100访问来源主机
winnie@winnie:~$ bash log_process.sh -e /images/nasa-logo.gif
给定URL输出TOP 100访问来源主机
34      nexus.mlckew.edu.au
25      203.13.168.24
25      203.13.168.17
22      onramp2-9.onr.com
22      crl5.crl.com
21      198.40.25.102.sap2.artic.edu
20      msp1-16.nas.mr.net
19      dial055.mbnet.mb.ca
18      dialup551.chicago.mci.net
17      utsi057.utsi.com
17      cougar.oro.net
16      micromatix.jagunet.com
15      piweba3y.prodigy.com
10      maui48.maui.net
9       205.138.107.228
6       lash.vip.best.com
4       slip104x.slip.colostate.edu
4       198.83.214.16
3       www-relay.pa-x.dec.com
3       beastie-ppp3.knoware.nl
2       sw25-228.iol.it
2       pop29.solo.pipex.co.za
2       jimi.vianet.net.au
1       ix-wh5-26.ix.netcom.com
1       dialin-ttyqe.sky.net
1       204.101.83.24
winnie@winnie:~$ bash log_process.sh -h
log_process is a script that tackle with the logs
Usage:./log_process.sh [OPTITIONS]
-a                                                            get the TOP100 host and the times
-p                                                            get the TOP100 IP and the times
-l                                                            get the TOP100 url and the times
-s                                                            get the code and the times
-y                                                            get the 4xx code and.....
-e [url]                                                      get the TOP100 host of the specific url
winnie@winnie:~$ bash log_process.sh -l
统计最频繁被访问的URL TOP 100
97410   /images/NASA-logosmall.gif
75337   /images/KSC-logosmall.gif
67448   /images/MOSAIC-logosmall.gif
67068   /images/USA-logosmall.gif
66444   /images/WORLD-logosmall.gif
62778   /images/ksclogo-medium.gif
43687   /ksc.html
37826   /history/apollo/images/apollo-logo1.gif
35138   /images/launch-logo.gif
30346   /
27810   /images/ksclogosmall.gif
24606   /shuttle/missions/sts-69/mission-sts-69.html
24461   /shuttle/countdown/
24383   /shuttle/missions/sts-69/count69.gif
23405   /shuttle/missions/sts-69/sts-69-patch-small.gif
22453   /shuttle/missions/missions.html
19877   /images/launchmedium.gif
17247   /htbin/cdt_main.pl
12160   /shuttle/countdown/images/countclock.gif
12137   /icons/menu.xbm
12057   /icons/blank.xbm
10345   /software/winvn/winvn.html
10308   /icons/image.xbm
10134   /history/history.html
10126   /history/apollo/images/footprint-logo.gif
9439    /history/apollo/images/apollo-small.gif
9230    /history/apollo/images/footprint-small.gif
9037    /software/winvn/winvn.gif
8985    /history/apollo/apollo.html
8662    /software/winvn/wvsmall.gif
8610    /software/winvn/bluemarb.gif
8583    /htbin/cdt_clock.pl
7865    /shuttle/countdown/liftoff.html
7389    /shuttle/resources/orbiters/orbiters-logo.gif
7261    /images/shuttle-patch-logo.gif
7177    /history/apollo/apollo-13/apollo-13.html
7040    /images/
7029    /shuttle/countdown/video/livevideo2.gif
6615    /images/kscmap-tiny.gif
6517    /shuttle/technology/sts-newsref/stsref-toc.html
6309    /history/apollo/apollo-13/apollo-13-patch-small.gif
5613    /shuttle/missions/sts-71/sts-71-patch-small.gif
5264    /shuttle/missions/sts-69/images/images.html
5248    /icons/text.xbm
5093    /images/construct.gif
4869    /images/shuttle-patch-small.gif
4846    /shuttle/missions/sts-69/movies/movies.html
4791    /shuttle/missions/sts-70/sts-70-patch-small.gif
4785    /icons/unknown.xbm
4559    /shuttle/missions/sts-69/liftoff.html
4464    /facilities/lc39a.html
4434    /shuttle/resources/orbiters/endeavour.html
4365    /history/apollo/images/apollo-logo.gif
4066    /shuttle/missions/sts-70/mission-sts-70.html
4024    /images/lc39a-logo.gif
3817    /shuttle/resources/orbiters/endeavour-logo.gif
3706    /shuttle/technology/sts-newsref/sts_asm.html
3518    /shuttle/countdown/countdown.html
3507    /shuttle/missions/sts-71/movies/movies.html
3377    /shuttle/countdown/video/livevideo.jpeg
3140    /history/apollo/apollo-11/apollo-11.html
3130    /shuttle/missions/sts-71/mission-sts-71.html
3087    /shuttle/missions/sts-70/images/images.html
2945    /shuttle/missions/sts-71/images/images.html
2939    /shuttle/missions/sts-73/mission-sts-73.html
2865    /images/faq.gif
2864    /shuttle/technology/images/srb_mod_compare_1-small.gif
2818    /shuttle/technology/images/srb_mod_compare_3-small.gif
2715    /shuttle/technology/images/srb_mod_compare_6-small.gif
2701    /history/apollo/apollo-11/apollo-11-patch-small.gif
2586    /elv/elvpage.htm
2544    /shuttle/missions/sts-73/sts-73-patch-small.gif
2385    /shuttle/countdown/video/sts-69-prelaunch-pad.gif
2343    /shuttle/missions/51-l/mission-51-l.html
2293    /images/launch-small.gif
2256    /facilities/tour.html
2201    /shuttle/missions/51-l/51-l-patch-small.gif
2172    /images/kscmap-small.gif
2171    /shuttle/resources/orbiters/challenger.html
2159    /shuttle/missions/sts-71/movies/sts-71-launch.mpg
2146    /shuttle/technology/sts-newsref/sts-lcc.html
2133    /htbin/wais.pl
2120    /facts/about_ksc.html
2107    /history/mercury/mercury.html
2040    /images/mercury-logo.gif
1991    /elv/elvhead3.gif
1979    /images/launchpalms-small.gif
1936    /images/whatsnew.gif
1929    /history/apollo/apollo-spacecraft.txt
1915    /facilities/vab.html
1912    /shuttle/resources/orbiters/columbia.html
1908    /shuttle/countdown/lps/fr.html
1904    /shuttle/resources/orbiters/challenger-logo.gif
1892    /images/ksclogo.gif
1891    /whats-new.html
1874    /elv/endball.gif
1869    /history/apollo/apollo-13/apollo-13-info.html
1868    /shuttle/missions/sts-74/mission-sts-74.html
1845    /elv/PEGASUS/minpeg1.gif
1835    /elv/SCOUT/scout.gif
sort: write failed: 'standard output': Broken pipe
sort: write error
============= end ===================
winnie@winnie:~$ bash log_process.sh -h
log_process is a script that tackle with the logs
Usage:./log_process.sh [OPTITIONS]
-a                                                            get the TOP100 host and the times
-p                                                            get the TOP100 IP and the times
-l                                                            get the TOP100 url and the times
-s                                                            get the code and the times
-y                                                            get the 4xx code and.....
-e [url]                                                      get the TOP100 host of the specific url
winnie@winnie:~$ bash log_process.sh -e /whats-new.html
给定URL输出TOP 100访问来源主机
15      edams.ksc.nasa.gov
11      n868370.ksc.nasa.gov
11      163.206.89.4
10      128.159.165.149
9       www-c2.proxy.aol.com
7       www-c3.proxy.aol.com
7       www-b2.proxy.aol.com
7       www-a2.proxy.aol.com
7       www-a1.proxy.aol.com
7       128.159.121.34
6       www-d3.proxy.aol.com
6       www-d1.proxy.aol.com
6       www-c6.proxy.aol.com
6       www-b3.proxy.aol.com
6       trafalgar.ethz.ch
6       pl23688.ksc.nasa.gov
6       gikai.eng.nhk.or.jp
6       128.159.135.66
5       www-b5.proxy.aol.com
5       piweba3y.prodigy.com
5       m35958.ksc.nasa.gov
5       agora.carleton.ca
5       200.0.182.6
5       163.206.11.35
5       163.205.150.22
5       128.159.76.11
5       128.159.112.46
4       www-c5.proxy.aol.com
4       www-b4.proxy.aol.com
4       pnguyen.wff.nasa.gov
4       piweba5y.prodigy.com
4       piweba4y.prodigy.com
4       pcw28.pica.army.mil
4       n1123628.ksc.nasa.gov
4       n1032036.ksc.nasa.gov
4       gw_inet.pepboys.com
4       duckling.omsi.edu
4       dove.ksc.nasa.gov
4       doclab3.bwi.wec.com
4       disarray.demon.co.uk
4       derec
4       csc.sctboces.org
4       coopwf93.sp.trw.com
4       ad02-032.compuserve.com
4       141.102.80.205
4       128.159.112.22
3       www-relay.pa-x.dec.com
3       www-d4.proxy.aol.com
3       web.kyoto-inet.or.jp
3       universe29.barint.on.ca
3       tyo1.gate.nec.co.jp
3       ts03.dsi.uanl.mx
3       proxy.bellatlantic.com
3       ppp0e-01.rns.tamu.edu
3       ns1.maf.mobile.al.us
3       n1144700.ksc.nasa.gov
3       n1127156.ksc.nasa.gov
3       n1028287.ksc.nasa.gov
3       koriel.sun.com
3       igate.nrc.gov
3       h20-hrze.uni-duisburg.de
3       gw3.att.com
3       gw1.att.com
3       ftp.mel.aone.net.au
3       firnvx.firn.edu
3       fault.stanford.edu
3       dyn1.fyi.net
3       dialin1.globalserve.on.ca
3       beta.xerox.com
3       163.205.18.17
3       163.205.16.75
3       163.205.166.3
3       163.205.16.104
3       139.169.205.215
3       138.200.189.91
3       137.51.128.2
3       130.99.86.92
3       128.217.61.136
3       128.159.168.171
3       128.159.146.40
3       128.159.144.83
3       128.159.132.61
2       ztivax.zfe.siemens.de
2       www-c4.proxy.aol.com
2       www-c1.proxy.aol.com
2       world.evansville.net
2       vdggstudent.nac.ac.za
2       unknown.demon.co.uk
2       toro.neuroinformatik.ruhr-uni-bochum.de
2       tlh14.supernet.net
2       teal.ksc.nasa.gov
2       swhite.ksc.nasa.gov
2       srhmac.wiu.bgu.edu
2       spiral_b.secom-sis.co.jp
2       slip34.niagara.com
2       slip-2.rai.utp.ac.pa
2       slip2.hrz.uni-oldenburg.de
2       slip239.netaxis.com
2       slip145-54.ut.nl.ibm.net
2       sanantonio-1-5.i-link.net
winnie@winnie:~$ exit
asciinema: recording finished
asciinema: press <enter> to upload to asciinema.org, <ctrl-c> to save locally

View the recording at:

    https://asciinema.org/a/aQdzaTPKch5KVaXcz3F55rQTf

winnie@winnie:~$

```