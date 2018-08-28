# go-lambda

LambdaでGo言語を動かす際のサンプルです。Makefileを利用するときは事前に `aws-cli` を設定し、Makefile内の `role` を書き換えてください。（ `function` `handler` はそのままでも動きます。）

# Makefile

- Lambdaにアプロードするためのzipを生成する

```
make
```

- zipを生成し、新しく作成したLambda関数にアップロードする

```
make deploy
```

- zipを生成し、既存のLambda関数のコードを更新する

```
make update
```

- `make` で作成されたファイルを削除する

```
make clean
```