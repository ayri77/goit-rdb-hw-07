/*
1. Напишіть SQL-запит, який для таблиці orders з атрибута date витягує рік, місяць і число. 
Виведіть на екран їх у три окремі атрибути поряд з атрибутом id та оригінальним атрибутом date (всього вийде 5 атрибутів).

2. Напишіть SQL-запит, який для таблиці orders до атрибута date додає один день. 
На екран виведіть атрибут id, оригінальний атрибут date та результат додавання.

3. Напишіть SQL-запит, який для таблиці orders для атрибута date відображає кількість секунд з початку відліку (показує його значення timestamp). 
Для цього потрібно знайти та застосувати необхідну функцію. На екран виведіть атрибут id, оригінальний атрибут date та результат роботи функції.

4. Напишіть SQL-запит, який рахує, скільки таблиця orders містить рядків з атрибутом date у межах між 1996-07-10 00:00:00 та 1996-10-08 00:00:00.

5. Напишіть SQL-запит, який для таблиці orders виводить на екран атрибут id, атрибут date та JSON-об’єкт {"id": <атрибут id рядка>, "date": <атрибут date рядка>}. 
Для створення JSON-об’єкта використайте функцію.
*/
USE `goit-rdb-hw-03`;

-- Step 1.
SELECT
    id,
    `date`,
    YEAR(`date`) AS order_year,
    MONTH(`date`) AS order_month,
    DAY(`date`) AS order_day
FROM orders;

-- Step 2.
SELECT
    id,
    `date`,
    DATE_ADD(`date`, INTERVAL 1 DAY) AS next_day
FROM orders;

-- Step 3.
SELECT
    id,
    `date`,
    UNIX_TIMESTAMP(`date`) AS unix_timestamp
FROM orders;

-- Step 4.
SELECT
    COUNT(*) AS orders_count
FROM orders
WHERE `date` BETWEEN '1996-07-10 00:00:00' AND '1996-10-08 00:00:00';

-- Step 5.
SELECT
    id,
    `date`,
    JSON_OBJECT(
        'id', id,
        'date', `date`
    ) AS order_json
FROM orders;