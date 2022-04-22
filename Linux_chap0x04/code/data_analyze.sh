#! /bin/env bash

function help {
    echo "data analyze is a script that tackle with the information of the athletes in 2014 World Cup "
    echo "Usage:./data_analyze.sh [OPTITIONS]"

    echo "-a [[low:high]](eg. [0:20] refers to under 20 years)          give the number and percentage of the range"
    echo "-p [positon]                                                  give the number and percentage of the specific position"
    echo "-l                                                            give the longest name"
    echo "-s                                                            give the shortest name"
    echo "-e                                                            give the eldest athlete"
    echo "-y                                                            give the yongest athlete" 
   
}

if [[ ! -f "worldcupplayerinfo.tsv" ]]; then
    wget "https://c4pr1c3.github.io/LinuxSysAdmin/exp/chap0x04/worldcupplayerinfo.tsv"
fi
File="worldcupplayerinfo.tsv"
function age_range {
    young=${2:1}
    young=${young%:*}
    # echo $young    
    old=${2#*:}
    len=${#old}
    old=${old:0:$((len-1))}
    # echo $old
    count=0
    number=0
    awk -F '\t' 'BEGIN{ print "\n================= age_range called ==================="; } { num++; if($6>=yo && $6<=ol)co++; } END{ printf("the number of the athletes whose age is between %d and %f is %d\n", yo,ol,co);printf("the percentage of the group is %.2f%s\n", (co/num)*100,"%" );printf("================= age_range end ===================\n\n"); }' yo=$young ol=$old co=$count num=$number "$File"


}

function get_position {
    position=${2}
    number=0
    count=0
    awk -F '\t' 'BEGIN{ print "\n****************** get_postion called ****************** "; } { num++; if($5==po)co++; } END{ printf("the number of the athletes whose position is %s is %d\n", po,co);printf("the percentage of the group is %.2f%s\n", (co/num)*100,"%" );printf(" ****************** get_postion end ****************** \n\n"); }' po=$position co=$count num=$number "$File"

}

function longest_name {
    number=0
    character=""
    byte=""

    awk -F '\t' 'BEGIN{ print "\n------------------- longest_name called ------------------- "; print "Since the awk takes the unicode as auto, the string length is orderedby the character."} {if(length($9)>length(cha))cha=$9; } END{ printf("the longest name of character is %s\n",cha); printf(" ------------------- longest_name end ------------------- \n\n"); }' cha=$character  "$File"

   
}

function shortest_name {
    number=0
    character="sssssssssssssssssssssssss"

    awk -F '\t' 'BEGIN{ print "\n------------------- shortest_name called ------------------- "; print "Since the awk takes the unicode as auto, the string length is orderedby the character."} {if(length($9)<length(cha))cha=$9; } END{ printf("the longest name of character is %s\n",cha); printf(" ------------------- longest_name end ------------------- \n\n"); }' cha=$character  "$File"

   
}

function find_yongest {
    age=100
    namee=""
    awk -F '\t' 'BEGIN{ print "\n#################### find_yongest called ####################" } { if($6<ag){ag=$6;na=$9} } END{ printf("the yongest player is %d-year-old %s\n", ag,na);printf("#################### find_yongest end ####################\n" );}' ag=$age na=$namee "$File"
}

function find_eldest {
    age=1
    namee=""
    awk -F '\t' 'BEGIN{ print "\n#################### find_eldest called ####################" } { if($6>ag){ag=$6;na=$9} } END{ printf("the eldest player is %d-year-old %s\n", ag,na);printf("#################### find_eldest end ####################\n" );}' ag=$age na=$namee "$File"
}


case ${1} in 
    "") help;;
    "-a") age_range "$@";;
    "-p") get_position "$@";;
    "-l") longest_name "$@";;
    "-s") shortest_name "$@";; 
    "-y") find_yongest "$@";;
    "-e") find_eldest "$@";;
esac
