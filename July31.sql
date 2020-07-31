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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;


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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;


/*  Q3 
    2で作成したテーブルに対して、1件のレコードを追加するクエリを作成してください。(idカラムはAUTO INCREMENTのため、値を指定しないこと)
 */

/*  Q3-1  
    userテーブルにレコードを追加するクエリ
    値は以下を指定すること
    name: seiji
    age: 15
    gender: 1
*/
insert into user (
  name, age, gender
) values (
  "seiji", 15, 1
);

/*  Q3-2 
    user_infoテーブルレコードを追加するクエリ
    値を以下を指定すること

    user_id: 1
    email: seiji@nextbeat.net
    phone: 09011111111
*/

insert into user_info (
  user_id, email, phone
) values (
  1, "seiji@nextbeat.net", "09011111111"
);


/* 
    Q4 
    2で作成したテーブルに対して、複数レコードを一括で追加するクエリを作成してください。(idカラムはAUTO INCREMENTのため、値を指定しないこと)
*/

/* 
    Q4-1 
    userテーブルにレコードを一括で追加するクエリ
    値は以下を指定すること

    name: emiko
    age: NULL
    
    name: yoshinobu
    age: 22
    gender: 1
    
    name: yoichi
    age: 30
    gender: 1
    
    name: kazuya
    age: 18
    gender: 1
    
    name: kaoru
    age: 18
    gender: 3
*/

insert user (
  name, age, gender 
) values (
  "emiko", NULL, 2 
), (
  "yoshinobu", 22, 1 
), (
  "yoichi", 30, 1  
), (
  "kazuya", 18, 1 
), (
  "kaoru", 18, 3
);

/* 
    Q4-2
    user_infoテーブルにレコードを一括で追加するクエリ
    値は以下を指定すること

    user_id: 2
    email: emiko@nextbeat.net
    phone: 09022222222
    
    user_id: 3
    email: yoshinobu@nextbeat.net
    phone: 09033333333
    
    user_id: 4
    email: yoichi@nextbeat.net
    phone: 09044444444
    
    user_id: 5
    email: kazuya@gmail.com
    phone: 08055555555
    
    user_id: 6
    email: kaoru@gmail.com
    phone: 08066666666
*/

insert user_info (
  user_id, email, phone 
) values (
  2, "emiko@nextbeat.net", "09022222222"
), (
  3, "yoshinobu@nextbeat.net", "09033333333"
), (
  4, "yoichi@nextbeat.net", "09044444444"
), (
  5, "kazuya@gmail.com", "08055555555"
), (
  6, "kaoru@gmail.com", "08066666666"
);


/* 
    Q5 
    2で作成したテーブルに対して、全件レコードを取得するクエリを作成してください。
*/

/* 
    Q5-1 
    user テーブルに対して、全てのレコードを取得するクエリ
*/

select * from user;

/* 
    Q5-2 
    user_info テーブルに対して、全てのレコードを取得するクエリ
*/

select * from user_info;


/* 
    Q6 
    2で作成したテーブルに対して、レコードを取得するクエリを作成してください。
*/


/* 
    Q6-1 
    user テーブルに対して、 idとname のみ全件取得するクエリ
*/
select id, name from user;                                                                                                                                                 
/* 
    Q6-2 
    user_info テーブルに対して、user_idとemail のみ全件取得するクエリ
*/
select user_id, email from user_info;

/* 
    Q6-3
    user テーブルに対して、 age で降順をかけ全件取得するクエリ
*/
select * from user order by age desc;

/* 
    Q6-4 
    user_info テーブルに対して、 created_at で昇順をかけ全件取得するクエリ
*/
select * from user_info order by created_at ASC;

/* 
    Q6-5 
    user  テーブルに対して、 id が 2 のレコードのみ取得するクエリ
*/
select * from user where id = 2;

/* 
    Q6-6
    user テーブルに対して、 age が 20以下のレコードのみ取得するクエリ
*/
select * from user where age <= 20;

/* 
    Q6-7 
    user_info テーブルに対して、phone が 080 で始まるレコードのみ取得するクエリ
*/
select * from user_info where phone like "080%";  

/* 
    Q6-8 
    user_info テーブルに対して、 email が @nextbeat.net で終わるレコードのみ取得するクエリ
*/
select * from user_info where email like "%@nextbeat.net";

/* 
    Q6-9 
    user_info テーブルに対して, user_id が 1 ではないレコードを取得するクエリ
*/
select * from user_info where user_id not like 1;

/* 
    Q6-10
    user テーブルに対して、 id が 2 ~ 4 までのレコードを BETWEEN句を使用して取得するクエリ
*/
select * from user where id between 2 and 4; 

/* 
    Q6-11 
    user テーブルに対して、 id が [1,4] のレコードのみ取得するクエリ
*/
select * from user where id=1 or id=4;

/*
    Q6-12 
    user テーブルに対して、idで降順ソートしうち2件までレコードを取得するクエリ
*/
select * from user order by id desc limit 0, 2;

/* 
    Q6-13
    user テーブルに対して、idで降順ソートし2 ~ 4件目までのレコードを取得するクエリ
*/
select * from user order by id desc limit 2, 4;

/* 
    Q6-14 
    user  テーブルに対して、レコード数をカウントするクエリ
*/
select count(*) from user;

/*
    Q6-15
    userテーブルに対して、ageカラムの値ごとに、レコード数を集計するクエリ
*/
select age, count(*) from user group by age; 







