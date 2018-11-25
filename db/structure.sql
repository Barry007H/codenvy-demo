CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "plants" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "code" varchar NOT NULL, "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_plants_on_code" ON "plants" ("code");
INSERT INTO "schema_migrations" (version) VALUES
('20181125201211');


