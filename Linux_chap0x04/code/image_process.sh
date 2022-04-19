#!/bin/env bash

function help {
    echo "process_image is a script that qcan batch image files in all support formats in the specified directory "
    echo "Usage:./process_image.sh [OPTITIONS]"

    echo "-r,--rename [path] -p,--prefix [text]\-s,--suffix [text]               Batch rename all the images in the specified directory "
    echo "-c,--compress [path]                                                   Compress the image"
    echo "-co [path]                                                             Compress the image with the original height:width"
    echo "-w,--watermark [path] [text of watermark]                              Add a custom text watermark to the picture batch"
    echo "-t,--transform [path]                                                  Transform image into JPEG"
    echo "-h,--help                                                              Display this help page" 
    echo "======================= the output will be in the '.\res\' directory in default ================================"
}


function Rename {
    path=${2}
    for img in $(ls -r "${path}") ; do
        echo $img
        directory_path=${path%/*}
        full_name=${path##*/}
        full_name=${full_name%.*}
        img_type=${path##*.}
        if [[ ${3} == "-p" ]];then mv "${img}" "${directory_path}/${4}_${full_name}.$img_type"; fi
        if [[ ${3} == "-s" ]];then mv "${img}" "${directory_path}/${full_name}_${4}.$img_type"; fi
    done
         
}


function Compress {
    
    # echo "Compress called"
    path=${2}
    # echo "$path"
    img_type=${2##*.}
    # echo "$img_type"
    full_name=${2##*/}
    # echo "$full_name"
    directory_path=${2%/*}
    # echo "$directory_path"
    if [[ $img_type == jpeg ]];then
        if [[ ! -d "${directory_path}/res/" ]]; then
            mkdir $directory_path/res;fi
    convert $path -compress JPEG -quality "0" $directory_path/res/$full_name
    # echo "Compress success"; 
    fi

}

function Compress_origin {
    
    path=${2}
    img_type=${2##*.}
    full_name=${2##*/}
    directory_path=${2%/*}
    if [[ ! -d "${directory_path}/res/" ]]; then
        mkdir $directory_path/res; fi
    convert $path -resize 25% $directory_path/res/$full_name

}

function Add_watermark {
    path=${2}
    for img in $(ls -r "${path}") ; do
        echo $img
        directory_path=${img%/*}
        full_name=${img##*/}
        if [[ ! -d "${directory_path}/res/" ]]; then
            mkdir $directory_path/res; fi
        convert "$img" -pointsize 50 -fill gray -gravity southwest -draw "text 10,10 '${3}' " $directory_path/res/$full_name
    done

}

function transform {
    path=${2}
    for img in in $(ls -r "${path}") ; do
        echo $img
        img_type=${img##*.}
        full_name=${img}
        directory_path=${2%/*}
        if [[ ! -d "${directory_path}/res/" ]]; then
            mkdir $directory_path/res; fi
        if [[ $img_type == jpeg || $img_type == png || $img_type == svg ]];then mv "${img}" "${directory_path}/${full_name}.jpeg"; fi
    done
            
}

case ${1} in 
    "") help;;
    "-r") Rename "$@";;
    "--brename") Rename "$@";;
    "-c") Compress "$@";;
    "-co") compress_origin "$@";; 
    "-w") Add_watermark "$@";;
    "--watermark") Add_watermark "$@";;
    "-t") transform "$@"
esac