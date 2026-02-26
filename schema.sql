
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS quote_lines;
DROP TABLE IF EXISTS quotes;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
  account_id INTEGER PRIMARY KEY,
  account_name TEXT,
  country TEXT,
  segment TEXT,
  industry TEXT
);

CREATE TABLE products (
  product_id INTEGER PRIMARY KEY,
  sku TEXT,
  category TEXT,
  standard_cost REAL
);

CREATE TABLE quotes (
  quote_id INTEGER PRIMARY KEY,
  account_id INTEGER,
  owner TEXT,
  lead_source TEXT,
  quote_date TEXT,
  status TEXT,
  promised_lead_time_days INTEGER,
  FOREIGN KEY(account_id) REFERENCES accounts(account_id)
);

CREATE TABLE quote_lines (
  quote_line_id INTEGER PRIMARY KEY,
  quote_id INTEGER,
  product_id INTEGER,
  qty INTEGER,
  unit_price_quoted REAL,
  discount_pct REAL,
  FOREIGN KEY(quote_id) REFERENCES quotes(quote_id),
  FOREIGN KEY(product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  quote_id INTEGER,
  account_id INTEGER,
  order_date TEXT,
  shipped_date TEXT,
  status TEXT,
  FOREIGN KEY(quote_id) REFERENCES quotes(quote_id),
  FOREIGN KEY(account_id) REFERENCES accounts(account_id)
);

CREATE TABLE order_items (
  order_item_id INTEGER PRIMARY KEY,
  order_id INTEGER,
  product_id INTEGER,
  qty INTEGER,
  unit_price REAL,
  unit_cost REAL,
  FOREIGN KEY(order_id) REFERENCES orders(order_id),
  FOREIGN KEY(product_id) REFERENCES products(product_id)
);
