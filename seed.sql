-- Optional demo records for testing only.
-- Replace the placeholder password_hash with a real password hash before any real use.
-- Do not store plaintext passwords.

INSERT INTO users (usr_id, username, email, password_hash, role)
VALUES ('usr_demo_001', 'demo_analyst', 'demo-analyst@example.com',
        'REPLACE_WITH_A_REAL_PASSWORD_HASH', 'analyst')
ON CONFLICT (usr_id) DO NOTHING;

INSERT INTO source (source_id, name, source_type, onion_addr, auth_ref, created_by)
VALUES ('src_demo_001', 'Authorized Test Forum', 'forum', NULL,
        'AUTH-DEMO-001', 'usr_demo_001')
ON CONFLICT (source_id) DO NOTHING;

INSERT INTO crawl_job (job_id, intent_id, source_id, kind)
VALUES ('job_demo_001', 'intent_demo_001', 'src_demo_001', 'scheduled')
ON CONFLICT (job_id) DO NOTHING;
