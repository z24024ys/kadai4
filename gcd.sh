#!/bin/bash

# 引数が2つであることを確認する
if [ "$#" -ne 2 ]; then
    echo "Error: 引数が2つではありません"
    exit 1
fi

# 引数が自然数であることを確認する
if ! [[ "$1" =~ ^[1-9][0-9]*$ ]] || ! [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: 自然数を入力してください"
    exit 1
fi

# 最大公約数を計算する関数
gcd() {
    local a=$1
    local b=$2
    while [ $b -ne 0 ]; do
        local remainder=$((a % b))
        a=$b
        b=$remainder
    done
    echo $a
}

# 最大公約数を出力する
result=$(gcd "$1" "$2")
echo "最大公約数は: $result"
