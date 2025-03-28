# Node.js の公式イメージを使用
FROM node:18

# 作業ディレクトリを作成し設定
WORKDIR /app

# バックエンドとフロントエンドのpackage.jsonを/appにコピー
COPY ./MapQuiz-backend/package*.json /app/backend/
COPY ./MapQuiz-frontend/package*.json /app/frontend/

# バックエンドとフロントエンドの依存関係をインストール
RUN cd /app/backend && npm install
RUN cd /app/frontend && npm install

# バックエンドのソースコードを/appにコピー
COPY ./MapQuiz-backend/ /app/backend/

# コンテナ起動時にバックエンドとフロントエンドを実行
CMD sh -c "node /app/backend/index.cjs & npm run dev --prefix /app/frontend"


