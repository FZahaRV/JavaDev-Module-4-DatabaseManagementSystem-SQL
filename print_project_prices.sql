SELECT
    p.ID AS PROJECT_ID,
    p.START_DATE,
    p.FINISH_DATE,
    SUM(w.SALARY) * TIMESTAMPDIFF(MONTH, p.START_DATE, p.FINISH_DATE) AS PROJECT_COST
FROM
    project AS p
INNER JOIN
    project_worker AS pw ON p.ID = pw.PROJECT_ID
INNER JOIN
    worker AS w ON pw.WORKER_ID = w.ID
GROUP BY
    p.ID, p.START_DATE, p.FINISH_DATE
ORDER BY
    PROJECT_COST DESC;
