const { Pool } = require('pg');


const pool = new Pool({
  user: 'labber',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT students.id, students.name, students.cohort_id, cohorts.name AS cohort_name
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = '${process.argv[2]}'
LIMIT '${process.argv[3]}';
`)
.then(res => {
  console.log('##1 this is res ', res)
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_id} cohort`);
  })
})
.catch(err => {
  console.log('## 2 this is error ', err)
});
