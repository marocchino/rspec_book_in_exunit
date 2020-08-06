# Feedback

## 20.07.10 (Chapter 1)

## 20.07.16 (Chapter 2)

## 20.07.21 (Chapter 3)

## 20.07.28 (Chapter 4)

https://vega-c.slack.com/archives/CFLJTG8ET/p1595916059094900

- koga1020
  - コードの書き方自体は目新しいところは特になし。思想の部分が勉強になる
  - acceptance testを書いてくのは非常に良さそう。avalonでも取り入れたいので時間見つけてメインのユースケースを書きます
  - 次の開発スコープではガチガチではなくとも、テストコードベースで仕様の確認を取り入れていきたい
- marocchino
  - pending “xxx”（実行してエラー吐かないやつ） exunitにもほしいけどないのはしょうがない
  - 気になった探した[mixのenv設定](https://github.com/elixir-lang/elixir/blob/50293b46f13a86328f0ffabdcbb8592e29ac24c6/lib/mix/lib/mix/state.ex#L11)
  - [mix testのenv設定](https://github.com/elixir-lang/elixir/blob/50293b46f13a86328f0ffabdcbb8592e29ac24c6/lib/mix/lib/mix/tasks/test.ex#L187)
- StellarBiblos
  - 次あたりからTDDは真面目にやっていった方がいいかなみたいなところは思った
  - (仕様書の類書くのめちゃめんどいとほったらかしてるので)
  - 個人的に課題: 関数/moduleの入力補完
- Alice-96
  - 今日のところは、研修のプロジェクトのテストの時には、なんとなくでテストを書いていたので、RSpecではこんな書き方をするのかっていう感覚でした。
  - 正直なところ、他の先輩たちとの基礎知識が違ったり、他のテストの書き方を知らないので、RSpecの特徴を認識仕切れていないです。
  - 実際に動かして、復習するためにも、GitHubに概要がまとまっているのがとても助かります。

## 20.08.04 (Chapter 5)

- marocchino
  - `--no-ecto`から復元が大変だったのでなんかツールあったら嬉しいな（いまのところphx.newのやり直ししか無い）
  - connの中にprivateをENV代わりに使うのも試す価値あるかも
  - 後でhammoxと型系の説明が別途あったら良いかも
- koga1020
  - 内容はピンときた。これまで書いてたcontrollerのunit testはunit testではなかった説を感じたw
  - ExMachinaを入れたときにavalonのテストに大革命がおきたので、それと似た何か改善がまたできそうな余地を感じた
  - 今後外部APIを叩くパターンが増えていくので、そこで色々と活用できそう。
- Alice-96
  - テストで書いている構造はとてもわかりやすかった。解説があってみんなで話しながらやっていくスタイルが理解しやすくて良かった。
  - 研修のプロジェクトでやっていた時のcontrollerのテストはとても長くなっていたので、今回みたいなテストの切り分けをすると、コンパクトでバグを解決しやすいテストになると思った。
- StellarBiblos
  - moxは可能性感じる
  - behaviorのパターンが増えるとその管理コストがかかる？ちょっと曖昧だが気になる
  - > これまで書いてたcontrollerのunit testはunit testではなかった説を感じた
    - acceptance test書いてた時の違和感これだわ
