# -*- coding: utf-8 -*-
require 'selenium-webdriver'
require 'date'
require 'logger'
require 'dotenv/load' # ENV['HOGE']

# ----- * 初期設定 * ----- #
log = Logger.new('./logs/log')
## DateTime取得
dateTime = DateTime.now.strftime('%Y%m%d%H%M%S')
# ----- * ------- * ----- #

# ドライバの選択
driver = Selenium::WebDriver.for :chrome
# タイムアウト設定
wait = Selenium::WebDriver::Wait.new(timeout: 10)

# アクセス
driver.get ENV['URL']
puts driver.title
puts driver.current_url
# 入力
begin
  driver.find_element(:id, "identity").send_key ENV['USERNAME']
  driver.find_element(:id, "password").send_key ENV['PASSWORD']
  driver.find_element(:name, "commit").click
rescue
    puts "login error"
    log.error("Login error")
    driver.quit
    
end
puts "login success：" + ENV['USERNAME']

# 記事を表示する
articlesTitle = driver.find_elements(:class, 'tr-Item_title')
if articlesTitle.length > 0 then
    for i in 0..articlesTitle.length-1
        puts driver.find_elements(:class, 'tr-Item_title')[i].text
        log.debug(driver.find_elements(:class, 'tr-Item_title')[i].text)
    end
    driver.quit
else
    puts "記事がありません"
    log.error("記事がありません")
    driver.quit
end


