

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia


SELECT `students`.`name` AS "nome",
		`students`.`surname` AS "cognome",
   		`degrees`.`name` AS "nome_corso" 
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id`= `degrees`.`id`
WHERE `degrees`.`name` LIKE "%economia%"





-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze


SELECT `degrees`.`name` AS "nome corso",
		`degrees`.`level` AS "livello",
        `departments`.`name` AS "nome_dipartimento"
FROM `degrees`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `degrees`.`level` = "magistrale"
		AND `departments`.`name` LIKE  "%Neuroscienze%"



-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `course_teacher`.`teacher_id` AS "id_insegnante", `degrees`.`name` AS "nome_corso"
FROM `course_teacher` 
INNER JOIN `degrees` 
ON `degrees`.`id` = `course_teacher`.`teacher_id` 
WHERE `course_teacher`.`teacher_id` = 44





-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
-- relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `students`.`surname`,
		`students`.`name`,
        `degrees`.`department_id` AS "numero_dipartimento",
        `degrees`.`name` AS "nome_corso",
        `degrees`.`level` AS "livello"
FROM `students`
INNER JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`  
ORDER BY `students`.`surname` ASC








-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT  `courses`.`id` AS "corso_id",
		`courses`.`name` AS "nome_corso",
        `courses`.`period` AS "periodo",
        
		`degrees`.`name` AS "corso_di_laurea",
        `degrees`.`level` AS "livello",
        `course_teacher`.`teacher_id` AS "id_teacher" 
FROM `courses` 
INNER JOIN `course_teacher` 
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `degrees` 
ON `courses`.`degree_id` = `degrees`.`id`
ORDER BY `degree_id`  ASC




-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

-- DA VERIFICARE
-- SELECT * 
-- FROM `departments`
-- INNER JOIN `degrees` 
-- ON `departments`.`id` = `degrees`.`department_id`
-- INNER JOIN `courses` 
-- ON `degrees`.`id` = `courses`.`degree_id`
-- INNER JOIN `course_teacher` 
-- ON `courses`.`id` = `course_teacher`.`course_id`
-- #INNER JOIN `teachers` 
-- #ON `course_teacher`.`course_id` = `teachers`.`id`  
-- WHERE `departments`.`name` LIKE "%matematica%"



SELECT  	`course_teacher`.`course_id` AS "id_corso",
			`departments`.`id` AS "id_dipartimento",
            `departments`.`name` AS "nome_dipartimento",
			`courses`.`degree_id` AS "Corso di laurea",
			`course_teacher`.`teacher_id` AS "id_Professore"
FROM `departments`
INNER JOIN `degrees` 
ON `departments`.`id` = `degrees`.`department_id`
INNER JOIN `courses` 
ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `course_teacher` 
ON `courses`.`id` = `course_teacher`.`course_id`
#INNER JOIN `teachers` 
#ON `course_teacher`.`course_id` = `teachers`.`id`  
WHERE `departments`.`name` LIKE "%matematica%"









-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
-- superare ciascuno dei suoi esami