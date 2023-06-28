# git clone失敗したとき

公開鍵登録した？

```
cat ~/.ssh/github.pub
```

登録場所
https://github.com/settings/keys

テスト実行
$ ssh -T git@github.com

詳細
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection

clone実行
git clone git@github.com:hurryth30/dotfiles2.git

→"https"用じゃなく"SSH通信用"のurlを使う
