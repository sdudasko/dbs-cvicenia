-- 1. Napíšte SELECT, ktorý vráti mená a dátumy registrácie všetkých programátorov.

SELECT name, signed_in_at FROM programmers;

-- 2. Napíšte SELECT, ktorý vráti mená a dátumy registrácie všetkých programátorov, ktorých mená začínajú na písme no R.

SELECT name, signed_in_at FROM programmers WHERE "name" LIKE 'R%';

-- 3. Napíšte SELECT, ktorý vráti meno a dátum registrácie najnovšieho programátora, ktorého meno začína na písmeno R. Hint: limit.

SELECT name, signed_in_at FROM programmers WHERE "name" LIKE 'R%' ORDER BY signed_in_at DESC LIMIT 1;

-- 4. Napíšte SELECT, ktorý vráti mená všetkých programátorov, ktorí majú meno kratšie ako 12 znakov.

SELECT "name", "signed_in_at" FROM programmers WHERE LENGTH(name) < 12;

-- 5. Napíšte SELECT, ktorý vráti mená všetkých programátorov, pričom tí, ktorí majú meno dlhšie ako 12 znakov ho budú mať skrátené na 12 znakov.

 SELECT LEFT (name, 12) FROM programmers;

-- 6. Napíšte SELECT, ktorý vráti mená všetkých programátorov vypísané naopak a veľkými písmenami.

SELECT REVERSE(UPPER(name)) FROM programmers;

-- 7. Napíšte SELECT, ktorý vráti len prvé slovo z mien všetkých programátorov.

SELECT TRIM(SUBSTRING(name, 0, strpos(name, ' '))) from programmers;

-- 8. Napíšte SELECT, ktorý vráti mená a dátumy registrácie všetkých programátorov, ktorí sa zaregistrovali v roku 2016.

SELECT name, signed_in_at
	FROM(
	SELECT extract(year from signed_in_at) AS virtual_year, name, signed_in_at from programmers) as nieco
WHERE virtual_year = 2016;

-- 9. Napíšte SELECT, ktorý vráti mená a dátumy registrácie všetkých programátorov, ktorí sa zaregistrovali vo februári roku 2016.

-- Len zo srandy to ide aj takto :)
SELECT name, signed_in_at FROM (
	(SELECT
		extract(year from signed_in_at) AS virtual_year,
		extract(month from signed_in_at) AS virtual_month,
	name, signed_in_at from programmers)
) AS nieco WHERE virtual_year = 2016 AND virtual_month = 2;

-- Alebo jednoduchym porovnavanim:

SELECT name, signed_in_at FROM programmers WHERE signed_in_at > '2016-01-31' AND signed_in_at < '2016-03-01';


-- 10. Napíšte SELECT, ktorý vráti mená všetkých programátorov a počet dní medzi dátumom ich registrácie a prvým aprílom 2016S usporiadaný od najmenšieho po najväčší.

SELECT	ABS(signed_in_at - '2016-02-01') as date_diff FROM programmers ORDER BY date_diff ASC;

-- 11. Napíšte SELECT, ktorý vráti label všetkých jazykov, ktoré majú aspoň jeden projekt.

SELECT DISTINCT label FROM languages
INNER JOIN projects ON languages.id = projects.language_id

-- 12. Napíšte SELECT, ktorý vráti label všetkých jazykov, ktoré majú aspoň jeden projekt, ktorý začal v roku 2014.

SELECT
	projects.created_at AS proj_created_at,
	languages.label     AS lang_label
FROM languages INNER JOIN projects ON languages.id = projects.language_id
WHERE EXTRACT(year FROM projects.created_at) = 2014

-- 13. Napíšte SELECT, ktorý vráti mená všetkých projektov, na ktorých sa programuje v jazykoch ruby alebo python (Hint: IN).

SELECT name FROM projects INNER JOIN languages ON projects.language_id = languages.id
WHERE label IN ('ruby', 'python')

-- 14. Napíšte SELECT, ktorý vráti mená všetkých python programátorov.

-- Toto hadze nieco divne, neviem preco
-- SELECT projects.id AS project_id, language_id, languages.label, projects_programmers.programmer_id, programmers.name FROM languages
-- INNER JOIN projects ON languages.id = projects.language_id
-- INNER JOIN projects_programmers ON projects_programmers.project_id = project_id
-- INNER JOIN programmers ON programmers.id = programmer_id
-- WHERE label = 'python'

SELECT
DISTINCT programmers.name FROM projects_programmers
INNER JOIN projects ON projects.id = project_id
INNER JOIN languages ON languages.id = projects.language_id
INNER JOIN programmers ON programmers.id = programmer_id
WHERE label = 'python';


-- 15. Napíšte SELECT, ktorý vráti mená všetkých python programátorov, ktorí sú vlastníkmi (hoc aj nepython) projektu

SELECT
DISTINCT programmers.name FROM projects_programmers
INNER JOIN projects ON projects.id = project_id
INNER JOIN languages ON languages.id = projects.language_id
INNER JOIN programmers ON programmers.id = programmer_id
WHERE label = 'python' OR "owner";

