const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2]; // Get cohort name from command line argument
const limit = process.argv[3]; // Get limit from command line argument

pool.query(`
SELECT students.id, students.name, students.cohort_id, cohorts.name AS cohort_name
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = $1
LIMIT $2;
`, [cohortName, limit]) // Pass cohortName and limit as parameters
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_id} cohort`);
  })
})
.catch(err => {
  console.log('## 2 this is error ', err)
});
