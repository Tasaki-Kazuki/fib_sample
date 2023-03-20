# README
エンドポイントURL https://fib-sample.onrender.com/fib?n=99

## 概要
/fib?n=params の形でパラメーターを送り、パラメーターの値に応じたフィボナッチ数をjson形式でレスポンスする
- フィボナッチ数を求めるメソッド、コントローラー周りの説明は以下のp-rを参照
  - https://github.com/Tasaki-Kazuki/fib_sample/pull/1
- テストに関する説明は以下のp-rを参照
  - https://github.com/Tasaki-Kazuki/fib_sample/pull/2

## ソースコードの構成
コントローラー
app/controllers/fibonacci_controller.rb
コントローラーの設定、並びに、フィボナッチ数を求めるメソッド、パラメーターの制限のメソッドを実装

テスト
spec/requests/fibonacci_controller_spec.rb
requestのテスト、フィボナッチ数を求めるメソッドのテストを記述
