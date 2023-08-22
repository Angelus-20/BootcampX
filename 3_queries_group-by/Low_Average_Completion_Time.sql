SELECT 
  students.name AS student,
  AVG(assignment_submissions.duration) AS average_completion,
  AVG(assignments.duration) AS suggested_completion
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
JOIN assignments ON assignment_submissions.assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY student
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY average_completion ASC;