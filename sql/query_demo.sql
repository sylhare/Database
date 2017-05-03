-- Create the table
CREATE TABLE contacts (
        id int(6) NOT NULL auto_increment,
        firstname varchar(15) NOT NULL,
        lastname varchar(15) NOT NULL,
        phone varchar(20) NOT NULL,
        mobile varchar(20) NOT NULL,
        fax varchar(20) NOT NULL,
        email varchar(30) NOT NULL,
        web varchar(30) NOT NULL,
        PRIMARY KEY (id),
        UNIQUE id (id),
        KEY id_2 (id)
    );
    
-- Add a field in the table created
INSERT INTO contacts VALUES ('','John','Smith','01234 567890','00112 334455','01234 567891','johnsmith@gowansnet.com','http://www.gowansnet.com');

-- Look for every columns in contacts table
SELECT * FROM contacts;