FROM node:22-slim

# ワーキングディレクトリを設定
WORKDIR /app

# まずpackage*.jsonをコピー
COPY package*.json ./

# prepare スクリプトを実行せずに依存関係をインストール
RUN npm install --ignore-scripts

# ソースコードをコピー
COPY . .

# TypeScriptをビルド
RUN npm run build

# 実行ファイルに実行権限を付与
RUN chmod +x ./build/index.js

# 環境変数
ENV NODE_ENV=production

# コンテナ起動時のコマンド
CMD ["node", "./build/index.js"]
