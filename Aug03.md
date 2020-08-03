# SQL
## テーブル結合
```
SELECT カラム名１, カラム名2                       //結合するカラム
FROM  テーブル名１                                 //結合元のテーブル
JOIN  テーブル名２                                 //結合する他のテーブル
ON  テーブル名１.カラム１ = テーブル名２.カラム１  //結合条件
```

結合条件にあうレコードがない場合やNULLが含まれる場合、結合結果から消滅してしまう。  
対策として、*左外部結合*、*右外部結合*、*完全外部結合*を使用する。  

```
//左外部結合：左表を必ず出力する
SELECT カラム FROM 左表の名前
  LEFT JOIN 右表の名前
  ON 結合条件

//右外部結合：右表を必ず出力する
SELECT カラム FROM 左表の名前
  RIGHT JOIN 右表の名前
  ON 結合条件

//完全外部結合；左右の表を必ず出力する
SELECT カラム FROM 左表の名前
  FULL JOIN 右表の名前
  ON 結合条件
```



## フィールド操作
### `UPDATE`文
```
UPDATE テーブル名
  SET 列１=値１, 列２=値２
WHERE 条件                        //なくても良い
```

### `DELETE`文
WHERE句がない場合は、そのテーブルのフィールド全てを削除

```
DELETE FROM テーブル
WHERE 条件                       //なくても良い
```

## テーブル定義操作
### `ALTER`文
テーブル定義の変更

```
//カラムを追加
ALTER TABLE テーブル ADD カラム 型 制約

//既存カラムの後に新規カラムを追加
ALTER TABLE テーブル ADD カラム 型 制約 AFTER 既存カラム

//一番初めに新規カラムを追加
ALTER TABLE テーブル ADD カラム 型 制約 FIRST

//カラム削除
ALTER TABLE テーブル DROP カラム 型 制約

//カラムの型を変更
ALTER TABLE テーブル ALTER COLUMN カラム 新しい型
```

## 型
### `TEXT`型
格納できるデータサイズの指定がない、文字列データを扱うデータ型。  
ただし、最大長は以下の通り決まっている。  

```
//最大長は 255 (2^8 - 1) 文字
TINYTEXT

//最大長は 65535 (2^16 - 1) 。文字オプションの長さMを指定できる。
TEXT(M)

//最大長は 16777215 (2^24 - 1) 文字。
MEDIUMTEXT

//最大長は 4294967295 (2^32 - 1) 文字、または4Gバイト
LONGTEXT
```

参考サイト：
- [11.1.3 文字列型の概要](https://dev.mysql.com/doc/refman/5.6/ja/string-type-overview.html)
- [TINYTEXT, TEXT, MEDIUMTEXT および LONGTEXT](https://doc.ispirer.jp/sqlways/Output/SQLWays-1-202.html)

## 文字コードについて
### `ASCII`
最も基礎となる文字コード。  
「数字」、「アルファベット」、「記号」を1バイトで表現する。  

### `Shift-JIS`
ASCIIの文字コードに日本語の文字を加えたもの。  
半角カタカナは1バイトで表現し、それ以外の全角文字は、2バイトで表現する。  

### `UTF-8`
ASCIIコードの文字に加え、世界中の文字を加えたもの。  
ASCIIコードで以外の文字は、2～6バイトで表現され、日本語の文字は、基本的に3バイトで表現する。  

### `utf8mb4`
MySQLで扱うための文字コード。  
MySQLは3バイトまでの文字しか扱えないため、それ以上のバイト数の文字を扱えるようにするためにある。MySQL5.5から対応。  


参考サイト：
- [文字コードとは？~UTF-8はパソコンの世界共通語~｜データ分析用語を解説](https://www.gixo.jp/blog/12465/)
- [文字コードutf8とutf8mb4の違い MySQLでは絵文字の扱いに注意](https://yokonoji.work/utf-8mb4)
- [MySQLサポート文字コード一覧](https://dev.mysql.com/doc/refman/5.7/en/charset-charsets.html)

