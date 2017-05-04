INSERT INTO POST
(
	 POST_IDX
	,POST_CATEGORY
	,TITLE
	,CONTENTS
	,DEL_STATUS
	,REG_DATE
	,WRITER
)
VALUES
(
	 1
	,1
	,'TEST'
	,'CONTENTS'
	,'N'
	,SYSDATE()
	,0
);

INSERT INTO POST
(
     POST_CATEGORY
    ,TITLE
    ,CONTENTS
    ,DEL_STATUS
    ,REG_DATE
    ,WRITER
)
VALUES
(
     2
    ,'TEST'
    ,'@ROW'
    ,'N'
    ,SYSDATE()
    ,0
);

INSERT INTO CATEGORY_MASTER
(
	 CATE_CODE
	,CATE_TITLE
)
VALUES
(
	 1
	,'日常生活'
);

INSERT INTO CATEGORY_MASTER
(
	 CATE_CODE
	,CATE_TITLE
)
VALUES
(
	 2
	,'おしゃべり'
);
status;
INSERT INTO USER
(
	 
	USER_ID
	,PASSWORD
	,NICK_NAME
	,AUTHORITY
)
VALUES
(
	
	'kumaneko'
    ,'zndhk0'
    ,'クマネコ'
    ,'0'
);

INSERT INTO USER
(
	USER_ID
	,PASSWORD
	,NICK_NAME
	,AUTHORITY
)
VALUES
(
	'neku'
    ,'1234'
    ,'ねくねく'
    ,'1'
);

INSERT INTO comment
(
	 POST_IDX	
	,CONTENTS	
	,DEL_STATUS	
	,REG_DATE	
	,WRITER		
)
VALUES
(
	 
	 0
	,'日常ってアニメの名前では？'
	,'N'
	,SYSDATE()
	,1
);


SELECT
	p.POST_IDX,
	p.POST_CATEGORY,
	c.CATE_TITLE,
	p.TITLE,
	p.CONTENTS,
	p.DEL_STATUS,
	p.REG_DATE,
	p.WRITER	
FROM 
	POST p
INNER JOIN
	category_master c
ON p.POST_CATEGORY = c.CATE_CODE
WHERE
	p.DEL_STATUS = 'N'
ORDER BY p.POST_IDX DESC; 


			
			
			
			
update category_master set CATE_TITLE='mrS.category2' where CATE_CODE=2
update post set POST_CATEGORY=1 where post_idx=1

delete from category_master where cate_code=2
delete from post where post_idx=4;
delete from post where post_idx=5;

			
			select * from comment;