SELECT cst_id, COUNT(*) FROM --Subquery koristim za provjeru postoje li duple vrijednosti--
(
  Query
)t
GROUP BY cst_id
HAVING COUNT(*) > 1
