SELECT * FROM jsoren.PUBLIC_USER_INFORMATION
MINUS
SELECT * FROM VIEW_USER_INFORMATION;

SELECT * FROM VIEW_USER_INFORMATION
MINUS
SELECT * FROM jsoren.PUBLIC_USER_INFORMATION;

SELECT LEAST(USER1_ID, USER2_ID), GREATEST(USER1_ID, USER2_ID)
FROM jsoren.PUBLIC_ARE_FRIENDS
MINUS
SELECT LEAST(USER1_ID, USER2_ID), GREATEST(USER1_ID, USER2_ID)
FROM VIEW_ARE_FRIENDS;

SELECT LEAST(USER1_ID, USER2_ID), GREATEST(USER1_ID, USER2_ID)
FROM VIEW_ARE_FRIENDS
MINUS
SELECT LEAST(USER1_ID, USER2_ID), GREATEST(USER1_ID, USER2_ID)
FROM jsoren.PUBLIC_ARE_FRIENDS;

SELECT * FROM jsoren.PUBLIC_PHOTO_INFORMATION
MINUS
SELECT * FROM VIEW_PHOTO_INFORMATION;

SELECT * FROM VIEW_PHOTO_INFORMATION
MINUS
SELECT * FROM jsoren.PUBLIC_PHOTO_INFORMATION;

SELECT * FROM jsoren.PUBLIC_EVENT_INFORMATION
MINUS
SELECT * FROM VIEW_EVENT_INFORMATION;

SELECT * FROM VIEW_EVENT_INFORMATION
MINUS
SELECT * FROM jsoren.PUBLIC_EVENT_INFORMATION;

SELECT * FROM jsoren.PUBLIC_TAG_INFORMATION
MINUS
SELECT * FROM VIEW_TAG_INFORMATION;

SELECT * FROM VIEW_TAG_INFORMATION
MINUS
SELECT * FROM jsoren.PUBLIC_TAG_INFORMATION;
