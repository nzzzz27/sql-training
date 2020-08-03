/* Q7 2で作成したテーブルに対して、レコードを取得するクエリを作成してください。*/

/* Q7-1 
   userとuser_info のテーブルを次の条件で結合し出力するクエリ
   条件
   user のidとuser_infoのuser_idが等しい
   出力するレコードの形式は以下の様に id,user.name,user_info.phone,user_info.email とする
   
   +----+-----------+----------+------------------------+
   | id  | name   | phone  | email                  |
   +----+-----------+----------+------------------------+
*/
SELECT id, name, phone, email 
FROM user  
JOIN user_info 
ON user.id = user_info.user_id;

/*  Q8 
    2で作成したテーブルに対して、レコードを更新するクエリを作成してください。

    Q8-1 
    user テーブルの全てのレコードに対して、genderを1に変更するクエリ
*/
UPDATE user SET gender = 1;

/*  Q8-2 
    user_info テーブルの user_id カラムの値が3のレコードに対して、phoneカラムの値を 09012345678 に変更するクエリ */
UPDATE user_info 
  SET phone = "09012345678" 
WHERE user_id = 3;

/*  Q9
    2で作成したテーブルに対して、レコードを削除するクエリを作成してください。

    Q9-1
    user テーブルに対して、レコードを全て削除するクエリ */
DELETE FROM user; 

/*  Q9-2 
    user_info テーブルに対して、phoneカラムの値が 09011111111 のレコードを削除するクエリ */
DELETE FROM user_info WHERE phone = "09011111111";

/*  Q10
    2で作成したテーブルに対して、カラムを追加するクエリを作成してください。
    user_info テーブルに対して、profile カラムを追加するクエリ

    詳細
    text カラム
    phoneカラムの後に追加する */
ALTER TABLE user_info ADD profile text AFTER phone;
