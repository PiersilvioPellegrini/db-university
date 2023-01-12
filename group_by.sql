

-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT  YEAR(enrolment_date) AS "anno di iscrizione" ,COUNT(id) AS "iscritti_ogni_anno"
FROM `students` 
GROUP BY  YEAR(enrolment_date)








-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT `office_address`, COUNT(id) AS "Numero insegnanti"
FROM `teachers`
GROUP BY `office_address`






-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT `exam_id`, AVG(`vote`) AS "media_voti"
FROM `exam_student`
GROUP BY `exam_id`








-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT `department_id`, COUNT(`name`) as "corsi di laurea"
FROM `degrees`
GROUP BY `department_id`