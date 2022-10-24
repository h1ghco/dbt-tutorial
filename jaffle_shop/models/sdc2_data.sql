CREATE TABLE jaffle_shop.mock_orders(
order_id integer,
status varchar(100),
created_at date,
updated_at date);

INSERT INTO jaffle_shop.mock_orders(order_id, status, created_at, updated_at)
VALUES (1,'delivered','2022-01-01','2022-01-04'),
        (2,'shipped','2022-01-02','2022-01-04'),
        (3,'shipped','2022-01-02','2022-01-04'),
        (4,'processed','2022-01-04','2022-01-04');

UPDATE jaffle_shop.mock_orders
SET STATUS = 'delivered', updated_at = '2022-01-05'