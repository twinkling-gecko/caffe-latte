# Caffe Latte

## 開発環境

requirement:

- docker
- docker-compose
- visual studio code

### VSCode を利用する場合

1. VSCode に Remote - Containers 拡張を入れる
2. VSCode でこのリポジトリのフォルダを開く
3. VSCode 上で表示されるアラートに従い、「Reopen in Container」を選択する
   ![](https://user-images.githubusercontent.com/34061817/84776788-b8d82500-b01b-11ea-9f3c-ccb5af89b199.png)
   初回のみ docker コンテナのビルドが開始されるためそこそこ時間がかかる。
   また、任意のタイミングでコンテナを Rebuild することも可能。
4. 適当な go のコードを開く
   - 表示される go に関するダイアログはすべて無視する（5 の手順で解決する）
5. go のファイルを開いている間のみ右下に表示される「Analysis Tools Missing」を選択し、表示されたダイアログから「Install」を行う
   ![](https://user-images.githubusercontent.com/34061817/84777309-62b7b180-b01c-11ea-8ad3-40b3f14d5064.png)

#### 開発サーバーの起動方法

VSCode 上のターミナルより、

```bash
$ fresh
```

で開発サーバーが起動する。  
起動したままでソースコードを編集し保存すれば自動でホットリロード（再ビルド/再実行）が行われる。

ホスト側の `~/.gitconfig` もマウントするため、VSCode 上のターミナルより git も利用できる。
