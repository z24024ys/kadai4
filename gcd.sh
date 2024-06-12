#!/bin/bash

# 引数の数が2つであることを確認
if [ "$#" -ne 2 ]; then
    echo "Error: Exactly two arguments are required."
    exit 1
fi

# 引数が自然数であることを確認
if ! [[ "$1" =~ ^[1-9][0-9]*$ && "$2" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Arguments must be natural numbers."
    exit 1
fi

# ユークリッドの互除法で最大公約数を求める
a=$1
b=$2
while [ "$b" -ne 0 ]; do
    remainder=$((a % b))
    a=$b
    b=$remainder
done

echo "$a"
