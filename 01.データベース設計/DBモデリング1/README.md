## 課題1

### DBスキーマ設計
![ER図](./ER/ER%E5%9B%B3.png)

以下、各テーブルの管理する項目を記載する
1. 商品マスタ(Product)
  + 商品IDをプライマリキーとして、商品の一覧を管理するテーブル。このテーブルを作成することで、商品の追加にも対応できるようにした。
2. 商品種類(ProductType)
  + 商品種類IDをプライマリキーとして、全商品のカテゴリ一覧を管理するテーブル。このテーブルを作成することで、にぎりとは違うカテゴリの販売時(ex.うどんやそばなどの販売)にも対応できるようにした。
3. 値段(Price)
  + 値段IDをプライマリキーとして、各商品の値段を管理するテーブル。商品の値段の変更時にはこのテーブルの値段を修正すれば対応できる。
4. 顧客(Customer)
  + 顧客IDをプライマリキーとして、お持ち帰りメニューを注文する顧客の情報を管理するテーブル。電話番号や支払い済みかどうかを管理する。
5. 注文詳細(OrderDetails)
  + 注文IDをプライマリキーとして、顧客からの注文を管理するテーブル。各注文と顧客IDを紐付け、どの顧客がどの注文をしたかを管理する。
6. 注文履歴(OrderHistory)
  + 注文IDを外部キーとして注文された日時を管理するテーブル。

#### 物理モデルと論理モデルの違いについて
+ 論理モデル
  論理モデルは概念モデルをリレーショナルデータモデルで取り扱いやすいように詳細化したモデルのこと。
  (概念モデルとは、管理すべき情報（エンティティと属性）とそれらの関係が整理された抽象的なモデル」のこと)
  論理モデルでは、どのようなテーブルを作り、どのような列を設ければ、RDBに落とし込みやすいかを考える。業務に沿ってデータの洗い出しを行い、各スキーマの関係を記載後、データを正規化する。
  上記整理した情報をER図で表現する。
+ 物理モデル
   論理モデルをテーブルに落とし込むためにさらに詳細に表したモデルであり、データベースの情報と1対1の対応をしている。物理モデルは、「テーブル設計仕様書」や「DDL（Data Definition Language）スクリプト」として表現される。


## 課題2
#### 仕様変更について
- OrderDetailsテーブルへシャリフラグを追加し、注文時点でシャリのサイズを記録する。通常サイズであれば0、大であれば1、小であれば2というようにフラグ化することで、様々なシャリの大きさに対応する。

- 商品マスタに登録されている商品が過去どれぐらい注文されているかを月毎に集計するクエリは以下。
```sql
-- 9月に売れた寿司ネタを算出するクエリ
select 
	 PT.p_name as 商品名,
	sum(OD.amount) as 売り上げ個数
from 
	OrderDetails as OD
inner join 
	OrderHistory as OH
on
	OD.od_id = OH.od_id	
inner join 
	Product as PT
on
	OD.p_id = PT.p_id
inner join 
	Price as PE
on
	PT.price_id = PE.price_id
where
	PT.pt_id = 5 and OH.order_date BETWEEN '2022/09/01 00:00:00' AND '2022/09/30 23:59:59'
group by
	 PT.p_name
```

## 課題3
#### 追加仕様について
- しゃりは大きさだけでなく、しゃり自体の種類がネタによって変更されることがある。具体的には、すし酢を使う場合と赤酢を使使う場合である。本件に対応する為、ricekind_flagを作成。0であればすし酢、1であれば赤酢であり、今後新たな酢飯の種類にも対応できるようにした。

## 課題4
### ユースケース
- お寿司屋さんの各月の売り上げの集計を考える

MySQLのコンテナを使用し、最上部のER図をもとにDB構築を実施。
DBの構築手順は以下へ記載。

#### 前提
Dockerが使用できる環境

1. 以下のコマンドを実行
```bash
docker run --name mysql01 -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mysql:latest
```
2. プロセスが起動しているか確認
```bash
docker ps
```
以下のような出力があればOK
```bash
CONTAINER ID   IMAGE          COMMAND                  CREATED      STATUS         PORTS                               NAMES
0ed8373f8e3c   mysql:latest   "docker-entrypoint.s…"   2 days ago   Up 3 seconds   0.0.0.0:3306->3306/tcp, 33060/tcp   mysql01
```

3. docker execでコンテナと接続

```bash
docker exec -it mysql01 /usr/bin/mysql -u root -p
```

passwordは先ほど実行した`root`と記載し、Enter。

4. DBを作成する。(今回は`sushi`というDBを作成)
```sql
-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS sushi;
```

5. 以下のSQLを使用し、各テーブルを作成  
./sql/create_table.sql

6. 以下のSQLを使用し、サンプルデータをインサート  
./sql/insert_sample_data.sql

7. 後は以下のSQLを使用すれば、月別の合計金額が取得できる  
./sql/monthly_aggregation.sql

実行結果は以下

```sql
-- 各月の集計を出すクエリ
select
    sum(OD.amount*PE.price) as 支払い金額,
    DATE_FORMAT(OH.order_date, '%Y-%m') as 各月の集計金額
from 
	OrderDetails as OD
inner join 
	OrderHistory as OH
on
	OD.od_id = OH.od_id
inner join 
	Product as PT
on
	OD.p_id = PT.p_id	
inner join 
	Price as PE
on
	PT.price_id = PE.price_id
group by
  	OH.order_date
```
![実行結果](./img/result.png)