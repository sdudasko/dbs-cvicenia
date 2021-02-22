-- 1. Napíšte SELECT, ktorý vráti mená a dátumy registrácie všetkých programátorov.

-- SELECT name, signed_in_at FROM programmers

-- 2. Napíšte SELECT, ktorý vráti mená a dátumy registrácie všetkých programátorov, ktorých mená začínajú na písme no R.

-- SELECT name, signed_in_at FROM programmers WHERE "name" LIKE 'R%'

-- 3. Napíšte SELECT, ktorý vráti meno a dátum registrácie najnovšieho programátora, ktorého meno začína na písmeno R. Hint: limit.

-- SELECT name, signed_in_at FROM programmers WHERE "name" LIKE 'R%' ORDER BY signed_in_at DESC LIMIT 1

-- 4. Napíšte SELECT, ktorý vráti mená všetkých programátorov, ktorí majú meno kratšie ako 12 znakov.

-- SELECT "name", "signed_in_at" FROM programmers WHERE LENGTH(name) < 12

-- 5. Napíšte SELECT, ktorý vráti mená všetkých programátorov, pričom tí, ktorí majú meno dlhšie ako 12 znakov ho budú mať skrátené na 12 znakov.

--  SELECT LEFT (name, 12) FROM programmers 

-- 6. Napíšte SELECT, ktorý vráti mená všetkých programátorov vypísané naopak a veľkými písmenami.

-- SELECT REVERSE(UPPER(name)) FROM programmers

-- 7. Napíšte SELECT, ktorý vráti len prvé slovo z mien všetkých programátorov.

-- SELECT TRIM(SUBSTRING(name, 0, strpos(name, ' '))) from programmers

-- 8. Napíšte SELECT, ktorý vráti mená a dátumy registrácie všetkých programátorov, ktorí sa zaregistrovali v roku 2016.

-- SELECT name, signed_in_at
-- 	FROM(
-- 	SELECT extract(year from signed_in_at) AS virtual_year, name, signed_in_at from programmers) as nieco
-- WHERE virtual_year = 2016;

-- 9. Napíšte SELECT, ktorý vráti mená a dátumy registrácie všetkých programátorov, ktorí sa zaregistrovali vo februári roku 2016.

-- Len zo srandy to ide aj takto :)
-- SELECT name, signed_in_at FROM (
-- 	(SELECT
-- 		extract(year from signed_in_at) AS virtual_year,
-- 		extract(month from signed_in_at) AS virtual_month,
-- 	name, signed_in_at from programmers)
-- ) AS nieco WHERE virtual_year = 2016 AND virtual_month = 2;

-- Alebo jednoduchym porovnavanim:



