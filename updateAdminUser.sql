-- Update the admin user's password
-- from Docker Desktop postgres container Exec tab run: psql -d n8n
-- or from a terminal run: docker exec -it name-of-your-postgres-container psql -d n8n
--    To find the name of your postgres container, run: docker ps
UPDATE "user" 
    SET "password" = crypt('your_new_password', gen_salt('bf', 10)) 
    WHERE "email" = 'youremail@example.com';

-- To check the password, run:
SELECT "email", "password" FROM "user" WHERE "email" = 'youremail@example.com';

-- if necessary install the pgcrypto extension before running the update:
CREATE EXTENSION pgcrypto;
