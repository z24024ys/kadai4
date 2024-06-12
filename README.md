# kadai4
#最大公約数を求めるシェルスクリプト (gcd.sh):

bash
#!/bin/bash

# 引数の数が2でない場合、エラー終了
if [ "$#" -ne 2 ]; then
    echo "Error: 2つの自然数を引数として入力してください" >&2
    exit 1
fi

# 引数が自然数でない場合、エラー終了
if ! [[ $1 =~ ^[1-9][0-9]*$ && $2 =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: 自然数を入力してください" >&2
    exit 1
fi

# 辞書順に並べ替える
a=$1
b=$2
if [ "$a" -lt "$b" ]; then
    tmp=$a
    a=$b
    b=$tmp
fi

# ユークリッドの互除法で最大公約数を求める
while [ "$b" -ne 0 ]; do
    tmp=$b
    b=$((a % b))
    a=$tmp
done

echo "$a"


#動作確認用のシェルスクリプト (test.sh):

bash
#!/bin/bash

# 最大公約数を求めるシェルスクリプトのパス
gcd_script="./gcd.sh"

# 関数: エラーを出力して終了
error_exit() {
    echo "Error: $1" >&2
    exit 1
}

# テストケース1: 正常な入力 (2と4を入力して2が出力されることを確認)
result=$("$gcd_script" 2 4)
if [ "$result" -ne 2 ]; then
    error_exit "最大公約数の計算が正しくありません"
fi

# テストケース2: 正常な入力 (3を入力してエラーが出ることを確認)
"$gcd_script" 3
if [ "$?" -eq 0 ]; then
    error_exit "正しくない入力に対してエラーが出ませんでした"
fi

# テストケース3: 正常な入力 (文字を入力してエラーが出ることを確認)
"$gcd_script" "a" "b"
if [ "$?" -eq 0 ]; then
    error_exit "正しくない入力に対してエラーが出ませんでした"
fi

echo "全てのテストが正常に終了しました"
