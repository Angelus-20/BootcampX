SELECT c.name as cohort, COUNT(assignment_submissions) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts c ON c.id = cohort_id
GROUP BY c.name
ORDER BY total_submissions DESC;


SELECT c.name AS cohort, COUNT(asub.duration) AS total_submissions
FROM cohorts c
JOIN students s ON c.id = s.cohort_id
JOIN assignment_submissions asub ON s.id = asub.student_id
GROUP BY c.name
ORDER BY total_submissions DESC;