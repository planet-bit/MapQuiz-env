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

# バックエンドとフロントエンドのソースコードを/appにコピー
COPY ./MapQuiz-backend/ /app/backend/
COPY ./MapQuiz-frontend/ /app/frontend/

# 両方のサービスを同時に立ち上げる
CMD cd /app/backend && npm run dev & cd /app/frontend && npm run dev
