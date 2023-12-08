CREATE TABLE IF NOT EXISTS "users"(
    "id" BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "Login" VARCHAR(255) NOT NULL,
    "LastName" VARCHAR(255) NOT NULL,
    "MiddleName" VARCHAR(255) NOT NULL,
    "Email" VARCHAR(255) NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY (id),
    CONSTRAINT uq_user_email UNIQUE ("Email")
);

CREATE TABLE IF NOT EXISTS "task_states"(
    "id" BIGINT NOT NULL,
    "Name" varchar NOT NULL,
    CONSTRAINT pk_task_states PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS "task_priority"(
    "id" BIGINT NOT NULL,
    "Name" varchar NOT NULL,
    CONSTRAINT pk_task_priority PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS "tasks"(
    "id" BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "Description" VARCHAR(255) NULL,
    "Performer" BIGINT NOT NULL,
    "Author" BIGINT NOT NULL,
    "State" BIGINT NOT NULL,
    "Priority" BIGINT NOT NULL,
    CONSTRAINT pk_tasks PRIMARY KEY (ID),
    CONSTRAINT tasks_author_foreign FOREIGN KEY("Author") REFERENCES users(id),
    CONSTRAINT tasks_performer_foreign FOREIGN KEY("Performer") REFERENCES users(id),
    CONSTRAINT tasks_state_foreign FOREIGN KEY("State") REFERENCES task_states(id),
    CONSTRAINT tasks_priority_foreign FOREIGN KEY("Priority") REFERENCES task_priority(id)
);

CREATE TABLE IF NOT EXISTS "comments"(
    "id" BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    "Text" VARCHAR(255) NOT NULL,
    "Task" BIGINT NOT NULL,
    "Author" BIGINT NOT NULL,
    CONSTRAINT pk_comments PRIMARY KEY (ID),
    CONSTRAINT "comments_author_foreign" FOREIGN KEY("Author") REFERENCES "users"("id"),
    CONSTRAINT "fk_comments_task" FOREIGN KEY("Author") REFERENCES "tasks"("id")
);
