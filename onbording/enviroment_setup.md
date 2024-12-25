# 初期セットアップ手順書 (Windows環境)

この手順書は、Windows PC上でPython環境を構築する前に必要なツールのインストール手順をまとめています。

---

## setup.bat

```
cd C:\path\to\your-project
scripts\setup.bat
```

以下のインストールを自動で実行します。



## Step 1: Visual Studio Code のインストール

1. **公式サイトにアクセス**  
   [Visual Studio Code ダウンロードページ](https://code.visualstudio.com/)

2. **インストーラをダウンロード**  
   Windows用のインストーラをダウンロード。

3. **インストール手順**  
   インストーラを起動し、以下の設定を確認または選択します：
   - 「**Add to PATH (環境変数に追加)**」にチェックを入れる。
   - 「**Install for all users**」を選択。

4. **Python拡張機能のインストール**  
   インストール後、VS Codeを起動し、左側の「拡張機能」アイコンをクリックして以下を検索してインストール：
   - `Python` x(Microsoft 提供)
   - `Jupyter`

---

## Step 2: Git のインストール

1. **公式サイトにアクセス**  
   [Git公式ダウンロードページ](https://git-scm.com/)

2. **インストーラをダウンロード**  
   Windows用のインストーラをダウンロード。

3. **インストール手順**  
   インストール中、以下の設定を確認：
   - 「**Adjusting your PATH**」で以下を選択：
     - **`Git from the command line and also from 3rd-party software`** を選択。
   - その他の設定はデフォルトで進めても問題ありません。

4. **インストール確認**  
   コマンドプロンプトまたはPowerShellを開き、以下のコマンドを実行：
   ```bash
   git --version
   ```

---

## Step 3: Python のインストール手順 (Windows環境)


1. **公式サイトにアクセス**
Pythonの公式ダウンロードページにアクセスします。  
[Python公式ダウンロードページ](https://www.python.org/downloads/)

2. **インストーラをダウンロード**
- 推奨される最新の安定版 (例: Python 3.10.x) をクリックしてダウンロードします。
- ダウンロードしたファイルを実行します。

3. **インストーラを実行**
インストーラを実行し、以下の手順で進めます：

4. **Add Python to PATH** に必ずチェックを入れる。
   - これにより、Pythonの実行ファイルが環境変数に追加されます。

5. **Customize installation** を選択。
   - **Optional Features** 画面ではすべてにチェックを入れて「Next」をクリック。
   - **Advanced Options** 画面では「Install for all users」を有効にして「Install」をクリック。

6. **インストール確認**
インストールが完了したら、コマンドプロンプトまたはPowerShellを開き、以下のコマンドを実行してインストールを確認します：

7. **Pythonのバージョン確認**
   ```bash
   python --version
   ```