SELECT SUM(assignments_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = assignment_submissions.students_id
WHERE students.cohort = 'FEB12';