#!/bin/bash

#ファイル作成
password_file=password.txt
if [ -f "password_file" ]; then
    touch password_file
fi

#初期表示
echo "パスワードマネージャーへようこそ！"

while true; do
    read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" action

    case $action in
        "Add Password")

        # Add Password が入力された場合
        read -p "サービス名を入力してください：" service_name
        read -p "ユーザー名を入力してください：" user_name
        read -p "パスワードを入力してください：" password
        # 入力情報をファイルへ保存
        echo "$service_name":"$user_name":"$password" >> password_file
        echo "パスワードの追加は成功しました。"
        ;;

        "Get Password")
        # Get Password が入力された場合
        サービス名を入力してください：
        ## サービス名が保存されていなかった場合
        そのサービスは登録されていません。
        ## サービス名が保存されていた場合
        サービス名：hoge
        ユーザー名：fuga
        パスワード：piyo
        ;;

        "Exit")
        # Exit が入力された場合
        echo "Thank you!"
        ## プログラムが終了
        exit 0
        ;;

        *)
        # Add Password/Get Password/Exit 以外が入力された場合
        echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
    esac
done