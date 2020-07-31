/*  Q1-1
    user という名前のデータベースを作成するクエリを作成してください
*/

CREATE DATABASE user;

/*  Q2 
    1で作成したデータベースに対して、テーブル作成をするクエリを作成してください
*/ 

/*  Q2-1 
    user テーブルを作成するクエリ 
*/
CREATE TABLE user ( 
  id    BIGINT(20)    UNSIGNED    AUTO_INCREMENT    NOT NULL,
  name   VARCHAR(255)    NOT NULL,
  age    SMALLINT(3)    UNSIGNED   NULL,
  gender    SMALLINT(3)    UNSIGNED    NOT NULL,
  updated_at   TIMESTAMP  NOT NULL  DEFAULT   CURRENT_TIMESTAMP,
  created_at    TIMESTAMP   NOT NULL    DEFAULT   CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
) ENGINE = InnoDB;


/* 文字コード変更 */
ALTER TABLE user CONVERT TO CHARACTER SET utf8mb4;


/*  Q2-2 
    user_info テーブルを作成するクエリ
*/
CREATE TABLE user_info (
  user_id   BIGINT(20)    UNSIGNED    NOT NULL,
  email   VARCHAR(255)    CHARACTER SET ASCII   NOT NULL    UNIQUE,
  phone   VARCHAR(16)   CHARACTER SET ASCII   NOT NULL,
  updated_at    TIMESTAMP   NOT NULL    DEFAULT   CURRENT_TIMESTAMP,
  created_at    TIMESTAMP   NOT NULL    DEFAULT   CURRENT_TIMESTAMP,
  PRIMARY KEY(user_id)
) ENGINE = InnoDB;




