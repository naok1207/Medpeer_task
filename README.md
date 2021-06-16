# 課題@Medpeer
アイデアを管理するAPI

仕様は`document.md`に記載

## 環境
- rails 6.0.2
- ruby 2.6.3
- sqlite

## gem
- factory_bot_rails
- rubocop-rails
- rubocop-rspec
- respec-rails

## エンドポイント
|content|HTTP|endpoint|controller|
|---|---|---|---|
|アイデア登録|POST|/api/ideas|api/ideas#create|
|アイデア取得|GET|/api/ideas|api/ideas#show|

## 実行確認
データ登録前
![データ登録前](https://gyazo.com/3b53e80329513d9922f0ac98f43a81a3.png)

アイデアを登録(success)
![アイデアを登録1(success)](https://gyazo.com/93adbde839d2936e5852ce1519c595f1.png)
![アイデアを登録2(success)](https://gyazo.com/b87861134b249da508bfc4316299a612.png)

アイデアを登録(failed)
![アイデアを登録(failed)](https://gyazo.com/70fd92bc91cf5fc9e6129696e664f747.png)

アイデアを取得(全アイデア)
![アイデアを取得(全アイデア)](https://gyazo.com/908d40342669151a0061b6a1b707d7ce.png)

アイデアを取得(カテゴリに関連した)
![アイデアを取得(カテゴリに関連した)](https://gyazo.com/3b646fe46cccf386312bbff802f7f819.png)

アイデアを取得(failed)
![アイデアを取得(failed)](https://gyazo.com/9678f1f1c3690c556974305d7e7e2f6d.png)
