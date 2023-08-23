SELECT assignments.id, name, day, chapter, COUNT(*) as total_requests
FROM teachers
JOIN assistance_requests ON assignment_id = assignments.id
GROUP BY assignments.id
ORDER BY total_requests DESC;