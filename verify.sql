-- 1) Confirm all tables exist
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN ('users', 'source', 'crawl_job')
ORDER BY table_name;

-- 2) Inspect table relationships and sample joined record
SELECT
    cj.job_id,
    cj.state AS job_state,
    cj.kind AS job_kind,
    s.source_id,
    s.name AS source_name,
    s.source_type,
    u.username AS source_created_by,
    s.auth_ref
FROM crawl_job AS cj
JOIN source AS s ON s.source_id = cj.source_id
JOIN users AS u ON u.usr_id = s.created_by
ORDER BY cj.created_at NULLS LAST, cj.job_id;

-- 3) Check basic row counts
SELECT 'users' AS table_name, COUNT(*) AS row_count FROM users
UNION ALL
SELECT 'source', COUNT(*) FROM source
UNION ALL
SELECT 'crawl_job', COUNT(*) FROM crawl_job;
