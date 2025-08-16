CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  tg_id BIGINT UNIQUE,
  username TEXT,
  wallet_address TEXT,
  credit_balance NUMERIC(30,8) DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE markets (
  id SERIAL PRIMARY KEY,
  question TEXT NOT NULL,
  starts_at TIMESTAMPTZ,
  closes_at TIMESTAMPTZ,
  resolves_at TIMESTAMPTZ,
  status TEXT DEFAULT 'scheduled',
  b_param NUMERIC DEFAULT 50,
  q_yes NUMERIC DEFAULT 0,
  q_no NUMERIC DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE positions (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  market_id INT REFERENCES markets(id),
  outcome TEXT,
  shares NUMERIC DEFAULT 0,
  avg_price NUMERIC DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE trades (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  market_id INT REFERENCES markets(id),
  side TEXT,
  outcome TEXT,
  shares NUMERIC,
  ton_amount NUMERIC,
  fee NUMERIC,
  price_snapshot NUMERIC,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE ledger (
  id SERIAL PRIMARY KEY,
  user_id INT,
  type TEXT,
  amount NUMERIC,
  ref_id TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);
