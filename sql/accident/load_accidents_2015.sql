LOAD DATA LOCAL INFILE '../resources/datasets/Accidents_2015.csv' INTO TABLE accidents_2015 FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES
(@col1, @dummy, @dummy, @dummy, @dummy, @dummy, @col2, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy) 
SET accident_index=@col1, accident_severity=@col2;

-- create median table
CREATE TABLE `accidents`.`accident_medians` (`vehicle_type` VARCHAR(45) NULL,`median_accident_severity` INT NULL);
