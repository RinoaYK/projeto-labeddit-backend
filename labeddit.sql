-- Active: 1685384571940@@127.0.0.1@3306

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    nickname TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    avatar TEXT DEFAULT('https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y'),
    created_at TEXT DEFAULT (DATETIME('now', '-3 hours')) NOT NULL
);

INSERT INTO users (id, nickname, email, password, role, avatar)
VALUES
  -- tipo NORMAL e senha = fulano123
	('u001', 'Fulano', 'fulano@email.com', '$2a$12$qPQj5Lm1dQK2auALLTC0dOWedtr/Th.aSFf3.pdK5jCmYelFrYadC', 'NORMAL', 'https://api.dicebear.com/6.x/adventurer/svg?seed=Bandit&scale=10'),

  -- tipo NORMAL e senha = beltrana00
	('u002', 'Beltrana', 'beltrana@email.com', '$2a$12$403HVkfVSUbDioyciv9IC.oBlgMqudbnQL8ubebJIXScNs8E3jYe2', 'NORMAL', 'https://api.dicebear.com/6.x/adventurer/svg?seed=Sasha&scale=10'),

  -- tipo ADMIN e senha = astrodev99
	('u003', 'Astrodev', 'astrodev@email.com', '$2a$12$lHyD.hKs3JDGu2nIbBrxYujrnfIX5RW5oq/B41HCKf7TSaq9RgqJ.', 'ADMIN', 'https://api.dicebear.com/6.x/bottts-neutral/svg?seed=Precious&scale=10'),
    
    -- tipo ADMIN e senha = lidia123
	('u004', 'Lidia', 'lidiay@email.com', '$2a$12$2eTrWiDLEt3ACyRuodvPveI9HmKDNnaa5UqfymrSNWddxFg8kKPjO', 'ADMIN','https://api.dicebear.com/6.x/avataaars/svg?seed=Lola&scale=10');

SELECT * FROM  users;

DROP TABLE users;

CREATE TABLE posts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT (0) NOT NULL,
    dislikes INTEGER DEFAULT (0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME('now', '-3 hours')) NOT NULL,
    updated_at TEXT DEFAULT (DATETIME('now', '-3 hours')) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE        
);

INSERT INTO posts (id, creator_id, content)
VALUES
    ("p001", "u001", "Bora Happy Hour!"),
    ("p002", "u004", "Hey hey, vamos finalizar o projeto Labeddit!"),
    ("p003", "u004", "Que tristeza meu tornozelo quebrado! T_T"),
    ("p004", "u003", "Curso da Labenu é o melhor!");

SELECT * FROM posts;
  
DROP TABLE posts;

CREATE TABLE
    likes_dislikes_posts (
        user_id TEXT NOT NULL,
        post_id TEXT NOT NULL,
        like INTEGER NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (post_id) REFERENCES posts (id) ON UPDATE CASCADE ON DELETE CASCADE
    );

INSERT INTO
    likes_dislikes_posts (user_id, post_id, like)
VALUES 
  ("u002", "p001", 1), 
  ("u003", "p001", 1), 
  ("u004", "p001", 0),
  ("u001", "p002", 1), 
  ("u002", "p002", 1),
  ("u003", "p002", 1),
  ("u001", "p003", 1),
  ("u002", "p003", 1),
  ("u003", "p003", 0),
  ("u001", "p004", 1),
  ("u002", "p004", 1),
  ("u004", "p004", 1);

SELECT * FROM likes_dislikes_posts;

DROP TABLE likes_dislikes_posts;

UPDATE posts SET likes = 2 WHERE id = "p001";

UPDATE posts SET dislikes = 1 WHERE id = "p001";

UPDATE posts SET likes = 3 WHERE id = "p002";

UPDATE posts SET likes = 2 WHERE id = "p003";

UPDATE posts SET dislikes = 1 WHERE id = "p003";

UPDATE posts SET likes = 3 WHERE id = "p004";

CREATE TABLE comments (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT (0) NOT NULL,
    dislikes INTEGER DEFAULT (0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME('now', '-3 hours')) NOT NULL,
    updated_at TEXT DEFAULT (DATETIME('now', '-3 hours')) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE               
    FOREIGN KEY (post_id) REFERENCES posts (id) ON UPDATE CASCADE ON DELETE CASCADE     
);

INSERT INTO comments (id, creator_id, post_id, content)
VALUES
    ("c001", "u002", "p001", "Bora bora!"),
    ("c002", "u003", "p002", "Bons estudos!"),
    ("c003", "u003", "p003", "Melhoras!"),
    ("c004", "u002", "p003", "Nossa, sinto muito!"),
    ("c005", "u004", "p004", "Muito bom!");

SELECT * FROM comments;
  
DROP TABLE comments;

CREATE TABLE
    likes_dislikes_comments (
        user_id TEXT NOT NULL,
        comment_id TEXT NOT NULL,
        like INTEGER NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (comment_id) REFERENCES comments (id) ON UPDATE CASCADE ON DELETE CASCADE
    );

INSERT INTO
    likes_dislikes_comments (user_id, comment_id, like)
VALUES 
  ("u001", "c001", 1), 
  ("u003", "c001", 1), 
  ("u004", "c001", 0),
  ("u004", "c002", 1), 
  ("u002", "c002", 1),  
  ("u004", "c003", 1),    
  ("u004", "c004", 1),
  ("u001", "c005", 1),
  ("u002", "c005", 1),
  ("u003", "c005", 1);

SELECT * FROM likes_dislikes_comments;

DROP TABLE likes_dislikes_comments;

UPDATE comments SET likes = 2 WHERE id = "c001";

UPDATE comments SET dislikes = 1 WHERE id = "c001";

UPDATE comments SET likes = 2 WHERE id = "c002";

UPDATE comments SET likes = 1 WHERE id = "c003";

UPDATE comments SET likes = 1 WHERE id = "c004";

UPDATE comments SET likes = 3 WHERE id = "c005";

DELETE FROM users
WHERE nickname = "";