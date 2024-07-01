
```bash
sqlite3 main.db
```

```sqlite 
ATTACH 'backup.db' AS backup;
```

```sqlite 
CREATE TABLE IF NOT EXISTS backup.users (
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    city TEXT
);
```


```sqlite
INSERT INTO backup.users (id, name, email, city)
SELECT id, name, email, city
FROM main.users
WHERE city = 'Specific City';

```


```sqlite
--- veryfi backup
SELECT * FROM backup.users;
```

```sqlite 
DETACH DATABASE backup;
```


```bash
#!/bin/sh

# Define the main database and backup database
MAIN_DB="main.db"
BACKUP_DB="backup.db"

# Open the main database and attach the backup database
sqlite3 $MAIN_DB <<EOF
ATTACH '$BACKUP_DB' AS backup;

-- Create the table in the backup database if it doesn't exist
CREATE TABLE IF NOT EXISTS backup.users (
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    city TEXT
);

-- Insert data into the backup database
INSERT INTO backup.users (id, name, email, city)
SELECT id, name, email, city
FROM main.users
WHERE city = 'Specific City';

-- Detach the backup database
DETACH DATABASE backup;
EOF

echo "Backup completed successfully."

```












```sqlite

sqlite3 your_database.db <<EOF
.headers off
.mode csv
.output output.csv
SELECT n.latitude, n.longitude, t.value AS name, t.value AS name
FROM nodes n
JOIN tags t ON n.id = t.nodeid
WHERE t.key = 'name';
EOF


psql -U your_username -d your_database -c "\COPY nodes FROM 'path/to/data.csv' DELIMITER ',' CSV HEADER;"


```