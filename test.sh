#!/bin/bash

# 最大公約数シェルスクリプトのパス
gcd_script="./gcd.sh"

# 正しい入力: 12と8の最大公約数は4
output=$(bash $gcd_script 12 8)
if [ "$output" != "最大公約数は: 4" ]; then
    echo "Test failed for input (12, 8)"
    exit 1
fi

# 正しい入力: 21と14の最大公約数は7
output=$(bash $gcd_script 21 14)
if [ "$output" != "最大公約数は: 7" ]; then
    echo "Test failed for input (21, 14)"
    exit 1
fi

# 正しくない入力: 引数が2つでない
output=$(bash $gcd_script 5)
if [ "$output" != "Error: 引数が2つではありません" ]; then
    echo "Test failed for incorrect input (5)"
    exit 1
fi

# 正しくない入力: 負の数
output=$(bash $gcd_script -8 12)
if [ "$output" != "Error: 自然数を入力してください" ]; then
    echo "Test failed for negative input (-8, 12)"
    exit 1
fi

# 正しくない入力: 文字列
output=$(bash $gcd_script abc def)
if [ "$output" != "Error: 自然数を入力してください" ]; then
    echo "Test failed for non-numeric input (abc, def)"
    exit 1
fi

echo "All tests passed"
