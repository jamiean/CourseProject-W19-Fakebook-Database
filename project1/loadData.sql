INSERT INTO USERS
SELECT DISTINCT USER_ID, FIRST_NAME, LAST_NAME, YEAR_OF_BIRTH, MONTH_OF_BIRTH, DAY_OF_BIRTH, GENDER
FROM jsoren.PUBLIC_USER_INFORMATION;

INSERT INTO Friends
SELECT DISTINCT LEAST(USER1_ID, USER2_ID), GREATEST(USER1_ID, USER2_ID)
FROM jsoren.PUBLIC_ARE_FRIENDS;


INSERT INTO Cities
SELECT NULL, CURRENT_CITY, CURRENT_STATE, CURRENT_COUNTRY
FROM jsoren.PUBLIC_USER_INFORMATION
WHERE CURRENT_CITY IS NOT NULL
UNION
SELECT NULL, HOMETOWN_CITY, HOMETOWN_STATE, HOMETOWN_COUNTRY
FROM jsoren.PUBLIC_USER_INFORMATION
WHERE HOMETOWN_CITY IS NOT NULL
UNION 
SELECT NULL, EVENT_CITY, EVENT_STATE, EVENT_COUNTRY
FROM jsoren.PUBLIC_EVENT_INFORMATION
WHERE EVENT_CITY IS NOT NULL;


INSERT INTO User_Current_Cities
SELECT DISTINCT k.USER_ID, C.CITY_ID
FROM jsoren.PUBLIC_USER_INFORMATION k, Cities C
WHERE k.CURRENT_CITY = C.CITY_NAME AND k.CURRENT_STATE = C.STATE_NAME AND k.CURRENT_COUNTRY = C.COUNTRY_NAME;

INSERT INTO User_Hometown_Cities
SELECT DISTINCT k.USER_ID, C.CITY_ID
FROM jsoren.PUBLIC_USER_INFORMATION k, Cities C
WHERE k.HOMETOWN_CITY = C.CITY_NAME AND k.HOMETOWN_STATE = C.STATE_NAME AND k.HOMETOWN_COUNTRY = C.COUNTRY_NAME;

INSERT INTO Programs
SELECT DISTINCT NULL, INSTITUTION_NAME, PROGRAM_CONCENTRATION, PROGRAM_DEGREE
FROM jsoren.PUBLIC_USER_INFORMATION
WHERE INSTITUTION_NAME IS NOT NULL;

INSERT INTO Education
SELECT DISTINCT k.USER_ID, p.PROGRAM_ID, k.PROGRAM_YEAR
FROM jsoren.PUBLIC_USER_INFORMATION k, Programs p
WHERE k.INSTITUTION_NAME = p.INSTITUTION AND k.PROGRAM_CONCENTRATION = p.CONCENTRATION AND p.DEGREE = k.PROGRAM_DEGREE;

INSERT INTO User_Events
SELECT DISTINCT k.EVENT_ID, k.EVENT_CREATOR_ID, k.EVENT_NAME, k.EVENT_TAGLINE, k.EVENT_DESCRIPTION, 
				k.EVENT_HOST, k.EVENT_TYPE, k.EVENT_SUBTYPE, k.EVENT_ADDRESS, C.CITY_ID, k.EVENT_START_TIME, k.EVENT_END_TIME
FROM jsoren.PUBLIC_EVENT_INFORMATION k, Cities C
WHERE EVENT_CREATOR_ID IS NOT NULL AND k.EVENT_CITY = C.CITY_NAME 
    							   AND k.EVENT_STATE = C.STATE_NAME AND k.EVENT_COUNTRY = C.COUNTRY_NAME;

INSERT INTO Albums
SELECT DISTINCT ALBUM_ID, OWNER_ID, ALBUM_NAME, ALBUM_CREATED_TIME, ALBUM_MODIFIED_TIME, ALBUM_LINK, ALBUM_VISIBILITY, COVER_PHOTO_ID
FROM jsoren.PUBLIC_PHOTO_INFORMATION
WHERE OWNER_ID IS NOT NULL AND COVER_PHOTO_ID IS NOT NULL;

INSERT INTO Photos
SELECT DISTINCT PHOTO_ID, ALBUM_ID, PHOTO_CAPTION, PHOTO_CREATED_TIME, PHOTO_MODIFIED_TIME, PHOTO_LINK
FROM jsoren.PUBLIC_PHOTO_INFORMATION
WHERE ALBUM_ID IS NOT NULL;

INSERT INTO TAGS
SELECT DISTINCT PHOTO_ID, TAG_SUBJECT_ID, TAG_CREATED_TIME, TAG_X_COORDINATE, TAG_Y_COORDINATE
FROM jsoren.PUBLIC_TAG_INFORMATION
WHERE PHOTO_ID IS NOT NULL AND TAG_SUBJECT_ID IS NOT NULL;
