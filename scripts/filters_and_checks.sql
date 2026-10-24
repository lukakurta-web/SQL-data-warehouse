--1) Provjera postoje li za Primary Key duple vrijednosti ili NULL--
SELECT
cst_id,
COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

--Uz pomoć window funkcija dodavanje oznake retcima koji su višak (WHERE != 1) ili koji su ispravni (WHERE = 1)--
SELECT
*
FROM (
SELECT
*,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
FROM bronze.crm_cust_info
)t WHERE flag_last = 1 AND cst_id IS NOT NULL;


--2) Provjera postoje li nepotrebni razmaci--
SELECT cst_firstname
FROM bronze.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname);


--3) Konzistentnost podataka--
SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info;

SELECT DISTINCT cst_marital_status
FROM bronze.crm_cust_info;


--Provjere 1), 2), i 3) se ponovno naprave nakon kreiranja tablica za Silver Layer
