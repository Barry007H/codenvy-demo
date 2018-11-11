CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "rooms" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "description" text NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_rooms_on_name" ON "rooms" ("name");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar NOT NULL, "last_name" varchar NOT NULL, "email" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE TABLE "messages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "room_id" integer, "user_id" integer, "body" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_messages_on_room_id" ON "messages" ("room_id");
CREATE INDEX "index_messages_on_user_id" ON "messages" ("user_id");
INSERT INTO "schema_migrations" (version) VALUES
('20181110105209'),
('20181111220835'),
('20181111221553');


