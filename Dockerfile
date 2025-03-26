# Node.jsの公式イメージをベースにする
FROM node:16

# pm2のインストール（使わないなら削除OK）
RUN npm install -g pm2

# 作業ディレクトリを設定
WORKDIR /app

# 依存関係をインストール
RUN git clone https://github.com/planet-bit/MapQuiz-frontend.git frontend \
    && git clone https://github.com/planet-bit/MapQuiz-backend.git backend \
    && cd frontend && npm install \
    && cd ../backend && npm install

# .env ファイルをコピー（volumes でマウントするなら削除OK）
COPY .env_backend /app/backend/.env

# 開発用のポートを開放
EXPOSE 5173 3000

# pm2 を使うなら
CMD ["pm2-runtime", "start", "ecosystem.config.js"]

# 使わないならこっち
# CMD ["sh", "-c", "cd /app/backend && npm run dev & cd /app/frontend && npm run dev"]



