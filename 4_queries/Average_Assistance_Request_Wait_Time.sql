SELECT AVG(started_at - created_at) as average_assistance_time 
FROM assistance_requests 
ORDER BY average_assistance_time;