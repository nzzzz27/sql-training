# Database Definition 
データベースの定義 

## 用語
### InnoDB
MySQL5.5以上の、デフォルトのストレージエンジン。  

> ストレートエンジンはストレージから必要な情報を引き出したり、保存したりします。または引き出した情報を目的に合わせて変更する場合もあります。これがストレートエンジンの大きな役割となります。
> ストレートエンジンがなければストレージにデータを保存することも引き出すこともできません。

参考：[MySQLのストレージエンジンと特徴](https://www.softagency.co.jp/column/column34#:~:text=MySQL%E3%81%AF%E3%83%AA%E3%83%AC%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%8A%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E3%81%A8%E3%81%97%E3%81%A6,%E3%82%B9%E3%83%88%E3%83%AC%E3%83%BC%E3%83%88%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%B3%E3%80%8D%E3%81%A8%E3%81%84%E3%81%84%E3%81%BE%E3%81%99%E3%80%82)

### インデックス
データベースで作成することのできる索引情報。  
作成するには、`CREATE INDEX`を使用する。  

特徴  
- 指定した列に対してつくした列に対して作られる
- 存在する列に対して検索が行われたとき、高速になることが多い  
- インデックスには名前を付けなければいけない  

```
CREATE INDEX インデックス名

//MySQL, MariaDB 
CREATE INDEX インデックス名 ON テーブル名
```

### `my.conf`
場所の調べ方
```
mysql --help | grep my.cnf
```

# 基本の操作
```
//新規DB作成
CREATE DATABASE データベース名;

//既存DB表示 
SHOW DATABASES;

//使用するデータベースを選択
USE データベース名;
```
```
//テーブル削除
DROP TABLE テーブル

//テーブルの全行を削除（初期化）
TRUNCATE TABLE テーブル

//カレントデータベースのテーブル名を表示
SHOW TABLES

//指定したテーブルのフィールドを表示
SHOW COLUMNS FROM データベース名.テーブル名

//現在のDBの文字コードを確認
show variables like "chara%"

//データベースの文字コードを確認
show table status from データベース名

//テーブルごとの文字コード確認
show create table テーブル名                

//テーブルの全てのカラムの文字コードを設定
ALTER TABLE 【テーブル名】 CONVERT TO CHARACTER SET 【文字コード】;

//テーブルの、一部のカラムの文字コードを変更
ALTER TABLE t MODIFY col1 CHAR(50) CHARACTER SET sjis;
```



## 更新
既存テーブルに列を追加する場合、挿入位置は原則として一番最後になる。  
DBMSによっては、挿入位置を任意に指定できるものもある。  
```
//列を追加
ALTER TABLE テーブル ADD 列名 型 制約

//列を削除
ALTER TABLE テーブル DROP 列名 型 制約

//カラム名を変更
ALTER TABLE テーブル名 rename to 新テーブル名

//型を変更
ALTER TABLE テーブル名 modify 列名 型
```


## ストレートエンジンを指定
ENGINE オプションを省略した場合、デフォルトのストレージエンジンが使用される
```
//エンジン指定 + テーブル作成
CREATE TABLE t1 (i INT) ENGINE = INNODB;

//テーブルを別のストレートエンジンに変換
ALTER TABLE t ENGINE = InnoDB;
```


# テーブル操作
## 作成
テーブル作成
```
CREATE TABLE テーブル (
  列1 列1の型,
  列2 列2の型,
  ...
);
```

## 型
### 数値
```
//整数値 符号付き -2147483648~2147483647 / 符号なし0~4294967295
INTEGER

//整数値 符号付き -9223372036854775808〜9223372036854775807 / 符号なし 0〜18446744073709551615
BIGINT

//整数値 符号付き -128〜127 / 符号なし 0〜255
TINYINT

//整数値 符号付き -32768〜32767 / 符号なし 0〜65535
SMALLINT

//整数値 符号付き -8388608〜8388607 / 符号なし 0〜16777215
MEDIUMINT

//小数 　ex) 1.2
DECIMAL
REAL

//符号なし
数値型 UNSIGNED

//最大幅表示（桁数）
//元の型の記憶領域を変更することはできない                  
INT(255)
```
その他の整数値関連の型：[整数型(TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT)](https://www.dbonline.jp/mysql/type/index1.html)


### 文字列
```
//固定長 ex) 215-0032（郵便番号）
CHAR

//可変長 ex) SQL入門
VARCHAR

//文字数指定
VARCHAR(255)
```

日付・時刻
```
TIMESTAMP ex) 2020-07-30 12:00:00 UTC
DATETIME ex) 2020-07-24 12:00:00
DATE     ex) 2020-07-24
TIME     ex) 12:00

```
TIMESTAPとDATETIMEの違い:サポート範囲
- TIMESTAMP: `'1970-01-01 00:00:01' UTC` ～ `'2038-01-19 03:14:07' UTC`
- DATETIME : `'1000-01-01 00:00:00' ` 〜 `'9999-12-31 23:59:59'`
参照：[11.3.1 DATE、DATETIME、および TIMESTAMP 型](https://dev.mysql.com/doc/refman/5.6/ja/datetime.html)

## 制約設定
|制約|概要|
|:---|:---|
| NOT NULL | NULLの格納を禁止する |
| UNIQUE | ある列の内容が重複してはいけない場合。NULLの重複は許容される|
| CHECK (条件式) | 条件式が真となる値だけが格納を許容される | 
| PRIMARY KEY | idなど、行を特定するために設定される列。UNIQUEかつNOT NULLの値|
| REFERENCES 参照先テーブル(参照先列) | 外部キー制約をかける |
| FOREIGN KEY(参照元列名) |
|REFERENCES 参照先テーブル名(参照先列名) | CREATE TABLE文の最後にまとめて外部キー制約をかける|
|CHARACTER SET 文字コード| その行の文字コードを指定 |

制約設定の例  
```
CREATE TABLE 家計簿 (
  日付   DATE         NOT NULL,
  費目ID INTEGER      REFERENCES 費目(ID),
  メモ   VARCHAR(100) DEFAULT '不明' NOT NULL,
  入金額 INTEGER      DEFAULT 0 CHECK (入金額 >= 0),
  出金額 INTEGER      DEFAULT 0 CHECK (出金額 >= 0),
);

CREATE TABLE 費目 (
  ID   INTEGER     PRIMARY KEY, 
  名前 VARCHAR(40) UNIQUE,
)
```

### PRIMARY KEY 
idなど、行を特定するために設定される列。UNIQUEかつNOT NULLの値
```
//単一行をPrimary Keyとして指定するとき
CREATE TABLE 家計簿 (
    id  INTEGER  PRIMARY KEY,
    name VARCHAR(100)
)

//複数行をPrimary keyとして指定するとき
CREATE TABLE 家計簿 (
    id  INTEGER,
    name VARCHAR(100),
    PRIMARY KEY(id, name)
)
```

### 外部キー制約（FOREIGN KEY）
参照整合性が崩れるようなデータ操作をしようとした場合にエラーを発生させ、強制的に処理を中断させる制約。 
```
//単一行に制約をかける
CREATE TABLE テーブル名 (
  列1  列1の型, 
  列2  列2の型 REFERENCES 参照先テーブル名(参照先列名), 
)

//複数行に制約をかける
CREATE TABLE テーブル名 (
  列1  列1の型,
  列2  列2の型,
  FOREIGN KEY(参照元列名) REFERENCES 参照先テーブル名(参照先列名)
)
```


## 既存テーブルの編集
### `INSERT`
```
INSERT INTO テーブル名 (
  列名1, 列名2, 列名3
) VALUES ( 
  値1, 値2, 値3
)
```


# 参考
- [15.1 ストレージエンジンの設定](https://dev.mysql.com/doc/refman/5.6/ja/storage-engine-setting.html)  
- [テーブル構造を変更する(ALTER TABLE文)](https://www.dbonline.jp/mysql/table/index18.html#section2)
- [[mysql]mysqlのint(11)のカッコ内の数値の意味](http://dbinfo.sakura.ne.jp/?contents_id=102)
