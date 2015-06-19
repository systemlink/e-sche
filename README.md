e-sche
======

スケジュール調整を簡単に行えるシステムです。  

### 動作環境

e-scheは以下の環境で動作します。  

* ruby 2.2.2
* rails 4.2.2

使用しているライブラリは下記の通りです。  
詳しくは [Gemfile](https://github.com/systemlink/e-sche/blob/master/Gemfile) を参照してください。  

* GEM
    * grape
    * rspec-rails
    * factory_girl_rails
    * backbone-on-rails
    * marionette-rails
    * ~~backbone-stickit-rails~~  
    Railsが4.0以下のみ対応のため削除
* javascript
    * Backbone.js
    * Marionette.js
    * backbone.stickit.js
* その他
    * CoffeeScript
    * Bootstrap

### 初期セットアップ

ruby 2.2.2は事前にインストールしてください。

    git clone https://github.com/systemlink/e-sche.git
    cd e-sche
    bundle install
