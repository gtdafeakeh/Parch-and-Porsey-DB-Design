--Create Parch and Porsey Tables

CREATE TABLE web_events (
id SERIAL,
account_id INT,
occured_at TIMESTAMPTZ,
channel VARCHAR(255)
);

CREATE TABLE sales_reps (
id SERIAL,
name VARCHAR(255),
region_id INT
);

CREATE TABLE accounts (
id SERIAL,
name VARCHAR(255),
website VARCHAR(255),
lat DECIMAL(9,6),
long DECIMAL (9,6),
primary_poc VARCHAR(255),
sales_rep_id INT
);

CREATE TABLE region (
id SERIAL,
name VARCHAR(255)
);

CREATE TABLE orders (
id SERIAL,
account_id INT,
standard_qty INT,
gloss_qty INT, --Added gloss_qty because required to calculate gloss_amt_usd
poster_qty INT,
total INT,
standard_amt_usd NUMERIC(10,2),
gloss_amt_usd NUMERIC(10,2),
poster_amt_usd NUMERIC(10,2),
total_amt_usd NUMERIC(10,2)
);

--Add Constraints
--Primary Keys

ALTER TABLE web_events
ADD CONSTRAINT web_events_pk PRIMARY KEY (id);

ALTER TABLE sales_reps
ADD CONSTRAINT sales_reps_pk PRIMARY KEY (id);

ALTER TABLE accounts
ADD CONSTRAINT accounts_pk PRIMARY KEY (id);

ALTER TABLE region
ADD CONSTRAINT region_pk PRIMARY KEY (id);

ALTER TABLE orders 
ADD CONSTRAINT orders_pk PRIMARY KEY (id);

--Foriegn Keys

ALTER TABLE web_events 
ADD CONSTRAINT web_events_account_fk FOREIGN KEY (account_id) 
REFERENCES accounts(id);

ALTER TABLE sales_reps
ADD CONSTRAINT sales_reps_region_fk FOREIGN KEY (region_id) 
REFERENCES region(id);

ALTER TABLE accounts
ADD CONSTRAINT accounts_sales_rep_fk FOREIGN KEY (sales_rep_id) 
REFERENCES sales_reps(id);

ALTER TABLE orders 
ADD CONSTRAINT orders_account_fk FOREIGN KEY (account_id) 
REFERENCES accounts(id);