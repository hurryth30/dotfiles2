#!/bin/sh

ID_RSA_GITHUB_NAME="github"

if [ ! -f $HOME/.ssh/${ID_RSA_GITHUB_NAME} ]; then
    echo "created ssh of github."
    # id_rsa作成
    ssh-keygen -t rsa -b 4096 -C "" -N "" -f ~/.ssh/${ID_RSA_GITHUB_NAME}
    chmod 600 ~/.ssh/${ID_RSA_GITHUB_NAME}*
    # ssh-addに追加
    echo "Add id_rsa to ssh-add"
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/${ID_RSA_GITHUB_NAME}
    # githubへpubキーの登録を促すメッセージ
    echo "Go to Github page regist pub key!"
    echo "https://github.com/settings/keys"
    echo "test ssh"
    echo "ssh -T github"

else
    echo "already created ssh of github."
fi

