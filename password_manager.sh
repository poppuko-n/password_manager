#!/bin/bash

#ファイル作成
password_file=password.txt
if [ -f "password_file" ]; then
    touch "$password_file"
fi

#初期表示
echo "パスワードマネージャーへようこそ！"

while true; do
    read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" action

    case $action in
        # Add Password が入力された場合
        "Add Password")
        read -p "サービス名を入力してください：" service_name
        read -p "ユーザー名を入力してください：" user_name
        read -p "パスワードを入力してください：" password

        # 入力情報をファイルへ保存
        echo "$service_name":"$user_name":"$password" >> "$password_file"
        echo "パスワードの追加は成功しました。"
        ;;

        # Get Password が入力された場合
        "Get Password")
        read -p "サービス名を入力してください：" get_service

        ## サービス名が保存されていなかった場合
        check=$(grep "^$get_service:" "$password_file")
        if  [ -z "$check" ]; then
            echo "そのサービスは登録されていません。"
        else
        ## サービス名が保存されていた場合
            IFS=':'
            read service user pass <<< "$check"
            echo "サービス名：$service"
            echo "ユーザー名：$user"
            echo "パスワード：$pass"
        fi
        ;;

        # Exit が入力された場合
        "Exit")
        echo "Thank you!"

        ## プログラムが終了
        exit 0
        ;;

        # Add Password/Get Password/Exit 以外が入力された場合
        *)
        echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
    esac
done