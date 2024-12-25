# onbording-starer-kit
プロジェクト初日からスムーズに作業を開始できるよう、必要な環境設定を簡単に自動化します。

<br>

## 手順

### 必要なツールをインストール

```bash
scripts\setup.bat 
```

下記のインストールが実行されます
- VScode
- Github
- Python
- VScode 拡張機能
  - vscode\extensions.txt に記載

### Scoop のインストール

`Scoop` は、Windows 向けのシンプルなコマンドラインパッケージマネージャーです。このガイドでは、`Scoop` をインストールする手順を説明します。

---

必要条件

1. **PowerShell**: Windows に標準搭載されています。
2. **.NET Framework 4.5 以降**: 最新バージョンの Windows を使用していれば既にインストールされています。
3. **インターネット接続**: スクリプトのダウンロードが必要です。

---

#### 1. PowerShell の実行ポリシーを変更

まず、PowerShell を **管理者権限** で実行し、以下のコマンドを入力してください。

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

- RemoteSigned: ローカルスクリプトを許可し、リモートスクリプトには署名を要求します。
- CurrentUser: 現在のユーザーのみに適用します。


#### 2. Scoop をインストール

以下のコマンドを PowerShell に入力して実行します。
管理者権限で実行するとエラーが発生するので注意

```powershell
iwr -useb get.scoop.sh | iex
```
- iwr: Invoke-WebRequest の略で、スクリプトをダウンロードします。
- iex: ダウンロードしたスクリプトをその場で実行します

#### 3. インストール確認
インストールが完了したら、以下のコマンドを実行して Scoop が正常にインストールされたか確認します。

```powershell
scoop --version
```

バージョン番号が表示されれば、インストール成功です。

<br>

## Git のコメントルール
### Prefix
- feat: 新しい機能
- fix: バグの修正
- docs: ドキュメントのみの変更
- style: 空白、フォーマット、セミコロン追加など
- refactor: 仕様に影響がないコード改善(リファクタ)
- perf: パフォーマンス向上関連
- test: テスト関連
- chore: ビルド、補助ツール、ライブラリ関連