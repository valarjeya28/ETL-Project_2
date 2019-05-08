Create database mtg_etl;
use mtg_etl;
ALTER DATABASE mtg_etl CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE core_card_objects (
  oracle_id INT PRIMARY KEY,
  
  name TEXT
);

ALTER TABLE core_card_objects
modify COLUMN oracle_id varchar(500);
CREATE TABLE set_description (
  productid int PRIMARY KEY,
  oracle_id varchar(500),
  set_name TEXT,
  rarity TEXT,
  reprint TEXT,
  promo TEXT,
  FOREIGN KEY (oracle_id) REFERENCES core_card_objects (oracle_id)
);
CREATE TABLE price (
  id int PRIMARY KEY,
  productid int,
  mtg_subTypeName varchar(500),
  highprice	 decimal(10,2),
  lowprice decimal(10,2),
  marketPrice decimal(10,2),
  midprice decimal(10,2),
  directLowPrice	decimal(10,2),
  FOREIGN KEY (productid) REFERENCES set_description(productid)
);

SELECT p.lowprice,c.name,s.set_name from price p  inner join set_description s on s.productid=p.productid
inner join core_card_objects c on c.oracle_id=s.oracle_id 

