# MapQuiz-env

## 概要

MapQuiz-envリポジトリは、MapQuizアプリケーションに必要な環境設定とDockerコンテナ設定を管理します。このリポジトリには、バックエンド、フロントエンド、およびデータベースを動作させるために必要な環境変数（.env）やDocker設定が含まれています。

## 環境構築

### 必要なツール

- Docker
- Docker Compose

### インストール手順

1. バックエンドリポジトリをクローン

   まず、MapQuiz-backend リポジトリをクローンします。このリポジトリは、API提供を担当します。

   ```sh
   git clone https://github.com/planet-bit/MapQuiz-backend.git
   ```

2. リポジトリをクローン

   次にMapQuiz-env リポジトリをクローンします。

   ```sh
   git clone https://github.com/planet-bit/MapQuiz-env.git
   cd MapQuiz-env
   ```
3. 環境変数ファイルの設定

   env.sampleにはサンプルのバックエンドの接続設定、
   .env.db.sampleにはサンプルのデータベースの接続設定が格納されています。
   
   まず .env.sample を /MapQuiz-backend/.env にコピー、
   次に .env.db.sample を /MapQuiz-env/.env.db にコピーします。


   ```sh
   cp .env.sample ../MapQuiz-backend/.env
   cp .env.db.sample .env.db
   ```

5. Dockerコンテナの起動

   Docker Composeを使用して、すべてのコンテナ（バックエンド、フロントエンド、データベース）を立ち上げます。

   ```sh
   docker-compose up
   ```

   これにより、以下のコンテナが起動します：

   - mapquiz-node-container（フロントエンド、バックエンド）
   - mapquiz-mysql-container（データベース）

6. バックエンドアプリの確認

   コンテナが起動した後、Node.jsのバックエンドアプリケーションが実行されます。
   
   
   バックエンドへは、http://localhost:3000 を開いて、APIが動作していることを確認してください。

   フロントエンドへは http://localhost:5173 でアプリにアクセスできます。
   
## 設定項目

### .env ファイルの設定

MapQuiz-envリポジトリ内の .env ファイルでは、アプリケーションが使用する各種環境変数を設定できます。主な設定項目は以下の通りです。

- DB_HOST: データベースのホスト（通常はmysql）
- DB_USER: データベースのユーザー名
- DB_PASSWORD: データベースのパスワード
- DB_NAME: 使用するデータベース名
- PORT: バックエンドのポート番号（デフォルトは3000）

これらの環境変数は、バックエンドの接続情報として使用されます。

### Dockerコンテナ

MapQuiz-env には、以下のコンテナ設定が含まれています。

- docker-compose.yml

   docker-compose.yml ファイルは、フロントエンド、バックエンド、データベースコンテナを一括で管理する設定ファイルです。このファイルを使用して、アプリケーション全体をコンテナ内で動かすことができます。

- Dockerfile
   フロントエンド（Vue.js）とバックエンド（Node.js）用のDockerfileが含まれており、アプリケーションの依存関係をインストールして実行します。
