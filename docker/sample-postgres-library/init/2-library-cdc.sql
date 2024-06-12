CREATE ROLE REPLICATION_GROUP;

GRANT REPLICATION_GROUP TO postgres;

ALTER TABLE "library"."author_alias" OWNER TO REPLICATION_GROUP;
ALTER TABLE "library"."users" OWNER TO REPLICATION_GROUP;
ALTER TABLE "library"."author_book" OWNER TO REPLICATION_GROUP;
ALTER TABLE "library"."authors" OWNER TO REPLICATION_GROUP;
ALTER TABLE "library"."books" OWNER TO REPLICATION_GROUP;
ALTER TABLE "library"."book_attribute" OWNER TO REPLICATION_GROUP;
ALTER TABLE "library"."issue_details" OWNER TO REPLICATION_GROUP;
ALTER TABLE "library"."reviews" OWNER TO REPLICATION_GROUP;
ALTER TABLE "library"."book_genre" OWNER TO REPLICATION_GROUP;

/*
* Create the publication for participating tables
*/
DROP PUBLICATION IF EXISTS "migrator_postgres_publication";
CREATE PUBLICATION "migrator_postgres_publication" FOR TABLE "library"."author_alias", "library"."users", "library"."author_book", "library"."authors", "library"."books", "library"."book_attribute", "library"."issue_details", "library"."reviews", "library"."book_genre";

/*
* Set Replica identity to FULL for each table participating in migration. For more information refer to PostgreSQL documentation here - https://www.postgresql.org/docs/current/sql-altertable.html#SQL-ALTERTABLE-REPLICA-IDENTITY
*/
        ALTER TABLE "library"."author_alias" REPLICA IDENTITY FULL;
        ALTER TABLE "library"."users" REPLICA IDENTITY FULL;
        ALTER TABLE "library"."author_book" REPLICA IDENTITY FULL;
        ALTER TABLE "library"."authors" REPLICA IDENTITY FULL;
        ALTER TABLE "library"."books" REPLICA IDENTITY FULL;
        ALTER TABLE "library"."book_attribute" REPLICA IDENTITY FULL;
        ALTER TABLE "library"."issue_details" REPLICA IDENTITY FULL;
        ALTER TABLE "library"."reviews" REPLICA IDENTITY FULL;
        ALTER TABLE "library"."book_genre" REPLICA IDENTITY FULL;
