from sqlalchemy import create_engine
import pandas as pd 
import psycopg2 
user = 'tradekit'
name = 'tradekit'
password = 'yourpassword'
raspberry = '192.168.0.174'

engine = create_engine(f'postgresql+psycopg2://{user}:{password}@{raspberry}')

customers = pd.read_csv('~/Downloads/jaffle_shop.customers.csv')
order = pd.read_csv('~/Downloads/jaffle_shop.orders.csv')
payment = pd.read_csv('~/Downloads/stripe_payment.csv')

customers.columns = [c.lower() for c in customers.columns]
customers.to_sql(name='customers',schema='jaffle_shop',con=engine,if_exists='append',chunksize=25000,method='multi', index=False)
order.columns = [c.lower() for c in order.columns]

order.to_sql(name='orders',schema='jaffle_shop',con=engine,if_exists='append',chunksize=25000,method='multi', index=False)
payment.columns = [c.lower() for c in payment.columns]

payment.to_sql(name='payment',schema='stripe', con=engine,if_exists='append',chunksize=25000,method='multi', index=False)

connection = psycopg2.connect(host=raspberry, database='tradekit', user='tradekit', password='yourpassword')
cursor = connection.cursor()
for index, row in z.iterrows():
cursor.execute("""CREATE SCHEMA stripe""")
connection.commit()
cursor.execute("""CREATE SCHEMA jaffle_shop""")
connection.commit()
cursor.execute("""DROP TABLE jaffle_shop.customers""")
connection.commit()
cursor.execute("""DROP TABLE jaffle_shop.orders""")
connection.commit()
cursor.execute("""DROP TABLE stripe.payment""")
connection.commit()
pd.read_sql_query('SELECT * FROM `stripe.payment`', con=engine)