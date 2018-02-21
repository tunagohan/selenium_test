# Seleniumテスト

## install Gem

```
$ gem install selenium-webdriver
$ gem install dotenv
```

## install chrome webdriver

```
$ brew install chromedriver
```

## Cheat Sheet

### 要素のテキストを取得する

```ruby
# Class
driver.find_element(:class, 'hogehoge').text
# ID
driver.find_element(:id, 'hugahuga').text
```


### 表示する

```ruby
# タイトルを表示する
puts driver.title
```

### 特定の要素をクリックする

```ruby
# Class
driver.find_element(:class, 'btn01').click

# ID
driver.find_element(:id, 'btn01').click
```

### フォームに入力をする
 
```ruby
# テキストフィールドに値を入れる
driver.find_element(:id, 'hogehoge').send_keys 'テキスト入力'
driver.find_element(:class, 'hugahuga').set 'テキスト入力'
```

### エンターキーを操作する

```ruby
driver.find_element(:id, '#hoge').native.send_keys(:enter)
```

### ラジオボタンを操作する

```ruby
# ラジオボタンがセットされた場合にのみ、チェックをクリック
unless driver.find_element(:id, 'hogehoge').selected?
  driver.find_element(:id, 'hogehoge').click
end
```

### セレクトボックスを操作する

```ruby
# セレクトタグの取得

# valueの値で選択
select.select_by(:value, 'value1')
# 表示テキストで選択
select.select_by(:text, '表示テキスト')
# 0始まりの選択
select.select_by(:index, 3)
```

### 待機

```ruby
# 要素が現れるまで待つ
wait.new(timeout: 10).until { driver.find_element(:id, 'hogehoge') }
# 要素が表示されるまで待つ
wait.until { driver.find_element(:id, 'hogehoge').displayed? }
```

### JSの期待値確認

```ruby
a = driver.switch_to.alert
if a.text == '期待値のテキスト'
  a.dismiss
else
  a.accept
end
```

### スクリーンショットを撮る

```ruby
driver.save_screenshot('path/to/hogehoge.png')
```

### xpathで記述する

```ruby
driver.find_element(:xpath, '//*[@id="hogehoge"]/div[2]/label').click
```

xpathはchromeのdeveloper toolより要素のcopyでxpathを指定すると取得できる
検証はconsoleより
```
$x('//*[@id="hogehoge"]/div[2]/label')
```
