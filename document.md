# 考えまとめ
## 機能
- アイデア登録
  - category, ideaの組み合わせ
- アイデア取得
  - categoryに紐づくidea

## table
- category
  - id: bigint
  - name: string, null: false

- idea
  - id: bigint
  - category_id: references
  - body: text, null: false

## 仕様
### 登録
- 登録
  - category_nameが存在する場合
    - 既存categoryを利用してideaを作成
  - category_nameが存在しない場合
    - 新規categoryを登録し、それを利用してideaを作成

リクエスト
```json
{
  "category_name": "<catgeory_name>",
  "body": "<body>"
}
```
レスポンス
```json
// success
{
  "status": 201
}
// failed
{
  "status": 422
}
```

### 取得
- アイデア一覧を返す
  - category_nameが指定されている場合
    - 該当するcategoryのidea一覧を返す
  - category_nameが指定されていない場合
    - 全てのideaを返す

リクエスト
```json
{
  "category_name": "category_name"
}
```
レスポンス
```json
// success
{
  "data": [
    {
      "id": 1,
      "category": "アプリ",
      "body": "タスク管理ツール"
    },
    {
      "id": 2,
      "category": "会議",
      "body": "オンラインでブレスト"
    }
  ]
}
// failed
{
  "status": 404
}
```
