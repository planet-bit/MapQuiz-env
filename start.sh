#!/bin/sh

# バックエンドを起動
node /app/backend/index.cjs &

# フロントエンドを起動
npm run dev --prefix /app/frontend -- --host
