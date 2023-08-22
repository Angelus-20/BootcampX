SELECT students.name AS student_id, AVG(assignment_submissions.duration) AS average_completion
FROM students
JOIN assignment_submissions ON assignment_submissions.student_id = students.id
WHERE end_date IS NULL
GROUP BY students.name
ORDER BY average_completion DESC;