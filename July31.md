# 用語
## SQLとクエリ
- SQL：データベースを操作するための言語
- クエリ：SQLを実行したときにデータベースに送る命令文
- カラム：column
- レコード：row
- フィールド：cell
 

# クエリ
## `INSERT`
```
//レコードを追加
insert into テーブル名 (
  列名1, 列名2
) values (値1, 値2);

//複数レコードを一括追加
insert テーブル名 (
  列名1, 列名2
) values (
  値1, 値2
), (
  値1, 値2
);
```

## `SELECT`
```
//全レコードを取得
select * from user;

//指定したカラムのレコードを取得
select id, name from user;

//降順に並び替え
select * from user order by age desc; 

//昇順に並び替え（ascending order）
select * from user order by age asc;

//複数の要素でソート（descending order）
select * from user order by id asc, age desc;                     
```

## `WHERE`句
```
//080を含むレコードを検索
select * from user_info where phone like "%080%";  

//080から始まるレコードを検索
select * from user_info where phone like "080%";

//080で終わるレコードを検索
select * from user_info where phone like "%080";

//山が二文字目にくるレコードを検索
select * from user_info where name like "_山%";
```
