--Unošenje podataka u tablice--

BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\Korisnik\Desktop\Luka\Data Analysis Course\SQL Course\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);


--Provjera je li tablica ispravno unešena--

SELECT * FROM bronze.crm_cust_info;
SELECT COUNT(*) FROM bronze.crm_cust_info;


--Brisanje podataka iz tablice, ako je nešto krivo napravljeno--

TRUNCATE TABLE bronze.crm_cust_info;
