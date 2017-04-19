--<ScriptOptions statementTerminator=";"/>

CREATE TABLE post (
	post_idx INT NOT NULL,
	post_category INT NOT NULL,
	title VARCHAR(100) NOT NULL,
	contents VARCHAR(4000) NOT NULL,
	status VARCHAR(1) DEFAULT N NOT NULL,
	reg_date TIMESTAMP DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
	post_witer INT DEFAULT 0 NOT NULL,
	PRIMARY KEY (post_idx)
) ENGINE=InnoDB;

