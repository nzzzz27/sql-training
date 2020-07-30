# Database Definition 
データベースの定義。  
1つのデータベースにテーブルは1つだけ持てる。  

## InnoDBとは
MySQL5.5以上の、デフォルトのストレージエンジン。  

> ストレートエンジンはストレージから必要な情報を引き出したり、保存したりします。または引き出した情報を目的に合わせて変更する場合もあります。これがストレートエンジンの大きな役割となります。
> ストレートエンジンがなければストレージにデータを保存することも引き出すこともできません。

参考：[MySQLのストレージエンジンと特徴](https://www.softagency.co.jp/column/column34#:~:text=MySQL%E3%81%AF%E3%83%AA%E3%83%AC%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%8A%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E3%81%A8%E3%81%97%E3%81%A6,%E3%82%B9%E3%83%88%E3%83%AC%E3%83%BC%E3%83%88%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%B3%E3%80%8D%E3%81%A8%E3%81%84%E3%81%84%E3%81%BE%E3%81%99%E3%80%82)


# 基本の操作
## 新規DB作成
```
mysql> CREATE DATABASE データベース名;
```

## 既存DB表示
```
mysql> SHOW DATABASES;
```

## 使用するデータベースを選択
```
mysql> USE データベース名;
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
数値
```
//整数値 ex) 3000
INTEGER

//小数 　ex) 1.2
DECIMAL
REAL
```

文字列
```
//固定長 ex) 215-0032（郵便番号）
CHAR

//可変長 ex) SQL入門
VARCHAR
```

日付・時刻
```
DATETIME ex) 2020-07-24 12:00
DATE     ex) 2020-07-24
TIME     ex) 12:00
```


## 制約設定
`NOT NULL`      : NULLの格納を禁止する。  
`UNIQUE`        : ある列の内容が重複してはいけない場合。NULLの重複は許容される。  
`CHECK (条件式)`: 条件式が真となる値だけが格納を許容される。  
`PRIMARY KEY`   : idなど、行を特定するために設定される列。UNIQUEかつNOT NULLの値。  
`REFERENCES 参照先テーブル(参照先列) `: 外部キー制約をかける。  
`FOREIGN KEY(参照元列名) REFERENCES 参照っ先テーブル名(参照先列名)`: CREATE TABLE文の最後にまとめて外部キー制約をかける。  
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


## 削除
テーブル削除
```
DROP TABLE テーブル
```

テーブルの全行を削除（初期化）
```
TRUNCATE TABLE テーブル
```


## 更新
既存テーブルに列を追加する場合、挿入位置は原則として一番最後になる。  
DBMSによっては、挿入位置を任意に指定できるものもある。  
```
//列を追加
ALTER TABLE テーブル ADD 列名 型 制約

//列を削除
ALTER TABLE テーブル DROP 列名 型 制約
```

# 参考
[15.1 ストレージエンジンの設定](https://dev.mysql.com/doc/refman/5.6/ja/storage-engine-setting.html)
