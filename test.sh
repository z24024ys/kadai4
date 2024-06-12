#!/bin/bash

# 関数：テストを実行し、結果を表示
function run_test {
    input=$1
    expected_output=$2

    # 実際の出力を取得
    output=$(./gcd.sh $input)

    # 期待される出力と一致するかを確認
    if [ "$output" -eq "$expected_output" ]; then
        echo "Test passed: input=$input, output=$output"
    else
        echo "Test failed: input=$input, expected=$expected_output, actual=$output"
        exit 1
    fi
}

# 正常系のテストケース
run_test "2 4" 2
run_test "12 18" 6

# 異常系のテストケース
./gcd.sh 3 && echo "Error: Test case should have failed." && exit 1
./gcd.sh "abc" && echo "Error: Test case should have failed." && exit 1

echo "All tests passed successfully."
