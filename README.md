# Todo App

React + Rails API + MySQL で構築したシンプルなTodoアプリケーションです。

## 技術スタック

- **Frontend:** React 18
- **Backend:** Ruby on Rails 7 (API mode)
- **Database:** MySQL 8.0
- **開発環境:** Docker / Docker Compose

## 機能

- ✅ タスクの追加
- ✅ タスクの一覧表示
- ✅ タスクの完了/未完了の切り替え
- ✅ タスクの削除
- ✅ レスポンシブデザイン

## プロジェクト構成

```
todoapp_claude/
├── docker-compose.yml          # Docker Compose設定
├── backend/                    # Rails API
│   ├── Dockerfile
│   ├── Gemfile
│   ├── app/
│   │   ├── models/todo.rb
│   │   └── controllers/api/v1/todos_controller.rb
│   ├── config/
│   │   ├── application.rb
│   │   ├── database.yml
│   │   └── routes.rb
│   └── db/migrate/
│       └── 001_create_todos.rb
└── frontend/                   # React アプリ
    ├── Dockerfile
    ├── package.json
    ├── src/
    │   ├── App.js
    │   ├── index.js
    │   └── components/
    │       ├── TodoForm.js
    │       ├── TodoList.js
    │       └── TodoItem.js
    └── public/
        └── index.html
```

## セットアップ・起動方法

### 前提条件
- Docker
- Docker Compose

### 1. リポジトリをクローン
```bash
git clone <repository-url>
cd todoapp_claude
```

### 2. アプリケーションを起動
```bash
docker-compose up --build
```

初回起動時は、以下の処理が自動的に実行されます：
- 依存関係のインストール
- データベースの作成とマイグレーション

### 3. アプリケーションにアクセス

- **フロントエンド（React）:** http://localhost:3001
- **バックエンド API（Rails）:** http://localhost:3000
- **データベース（MySQL）:** localhost:3306

## API エンドポイント

| HTTP Method | エンドポイント | 説明 |
|-------------|---------------|------|
| GET | `/api/v1/todos` | 全てのTodoを取得 |
| POST | `/api/v1/todos` | 新しいTodoを作成 |
| GET | `/api/v1/todos/:id` | 特定のTodoを取得 |
| PUT | `/api/v1/todos/:id` | 特定のTodoを更新 |
| DELETE | `/api/v1/todos/:id` | 特定のTodoを削除 |

### リクエスト例

#### Todoの作成
```bash
curl -X POST http://localhost:3000/api/v1/todos \
  -H "Content-Type: application/json" \
  -d '{"todo": {"title": "新しいタスク", "completed": false}}'
```

#### Todoの更新（完了状態の変更）
```bash
curl -X PUT http://localhost:3000/api/v1/todos/1 \
  -H "Content-Type: application/json" \
  -d '{"todo": {"completed": true}}'
```

## 開発

### バックエンドのみ起動
```bash
docker-compose up db backend
```

### フロントエンドのみ起動
```bash
docker-compose up frontend
```

### データベースのリセット
```bash
docker-compose exec backend rails db:drop db:create db:migrate
```

### ログの確認
```bash
# 全サービスのログ
docker-compose logs

# 特定のサービスのログ
docker-compose logs backend
docker-compose logs frontend
```

## トラブルシューティング

### ポートが使用中の場合
他のアプリケーションがポート3000、3001、3306を使用している場合は、`docker-compose.yml`のポート設定を変更してください。

### データベース接続エラー
データベースコンテナが完全に起動する前にRailsが起動しようとする場合があります。その場合は以下のコマンドでバックエンドを再起動してください：
```bash
docker-compose restart backend
```
