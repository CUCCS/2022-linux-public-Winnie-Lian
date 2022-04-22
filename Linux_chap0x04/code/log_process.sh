#!/bin/env bash

function help {
    echo "log_process is a script that tackle with the logs "
    echo "Usage:./log_process.sh [OPTITIONS]"

    echo "-a                                                            get the TOP100 host and the times"
    echo "-p                                                            get the TOP100 IP and the times"
    echo "-l                                                            get the TOP100 url and the times"
    echo "-s                                                            get the code and the times"
    echo "-y                                                            get the 4xx code and....."
    echo "-e [url]                                                      get the TOP100 host of the specific url " 
   
}
if [[ ! -e "web_log.tsv" ]]; then
    wget "https://c4pr1c3.github.io/LinuxSysAdmin/exp/chap0x04/web_log.tsv.7z"
    7z x web_log.tsv.7z
fi


File='web_log.tsv'
function top100_host {
    echo "统计访问来源主机TOP 100和分别对应出现的总次数"
    awk -F '\t' '{ host[$1]++ } END{ for(i in host) {print i,host[i]} } ' "$File" | sort -n -r -k2 | head -n 100 | awk '{ printf("%s\t%s\n",$2,$1); }'
    echo "============= end ==================="
}

function top100_ip {
    echo "统计访问来源主机TOP 100 IP和分别对应出现的总次数"
    awk -F '\t' '{if($1 ~ /[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*/){host[$1]++} } END{ for(i in host) {print i,host[i]} } ' "$File" | sort -n -r -k2 | head -n 100 | awk '{ printf("%s\t%s\n",$2,$1); }'
    echo "============= end ==================="
}

function top100_url {
    echo "统计最频繁被访问的URL TOP 100" 
    awk -F '\t' '{ host[$5]++ } END{ for(i in host) {print i,host[i]} } ' "$File" | sort -n -r -k2 | head -n 100 | awk '{ printf("%s\t%s\n",$2,$1); }'
    echo "============= end ==================="
}

function status_code {
    echo "统计不同响应状态码的出现次数和对应百分比" 
    number=$(awk -F '\t' '{num++} END{print num}' num=$number "$File")
    awk -F '\t'  'NR>1 { num++; host[$6]++; } END{ for(i in host) {print i,host[i]} } ' num=$number "$File" | sort -n -r -k2 | head -n 100 | awk -v numb=$number '{ printf("%s\t%s\t%.4f%\n",$2,$1,($2/numb)*100); }' 

}

function top10_URL {
    echo "分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数" 
    awk -F '\t'  'NR>1 { if($6 ~ /^4.*/){url[$5][$6]++;} } END{ for(i in url){for(k in url[i])print i,k,url[i][k]}; } ' "$File" | sort -n -r -k3 | head -n 10 | awk '{ printf("%s\t%s\t%s\t\n",$2,$3,$1); }' 

# 之前想的复杂版本
    # res1=$(awk -F '\t'  'NR>1 { if($6 ~ /4.*/){url[$5]++;} } END{ for(i in url) {print i,url[i]}; } ' "$File" | sort -n -r -k2 | head -n 10 | awk '{ printf("%s\t%s\t\n",$2,$1); }' )
    # res2=$(awk -F '\t'  'NR>1 { if($6 ~ /4.*/){code[$6]++;} } END{ for(i in code) {print i,code[i]}; } ' "$File" | sort -n -r -k2 | head -n 10 | awk '{ printf("%s\t\n",$2); }' )
    # for i in ${res2[*]}
    # do  
    #     for k in ${res1[*]}
    #     do

    #             echo $i
    #             echo $k
    #             echo ${res1[${k}]}
            
    #     done
    # done
}

function url_top100_ip {
    echo "给定URL输出TOP 100访问来源主机"
    url=${2}
    awk -F '\t' 'NR>1 {if($5==url){host[$1]++}} END{for(i in host){print i,host[i]}}' url=$url "$File" | sort -n -r -k2 | head -n 100 | awk '{printf("%s\t%s\t\n",$2,$1);}'
}



case ${1} in 
    "") help;;
    "-a") top100_host "$@";;
    "-p") top100_ip "$@";;
    "-l") top100_url "$@";;
    "-s") status_code "$@";; 
    "-y") top10_URL "$@";;
    "-e") url_top100_ip "$@";;
esac



