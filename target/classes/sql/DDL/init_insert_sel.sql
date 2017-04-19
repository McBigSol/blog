insert into post
(
	 post_idx
	,post_category
	,title
	,contents
	,status
	,reg_date
	,post_witer
)
values
(
	0
	,0
	,'test'
	,'contents'
	,'N'
	,sysdate()
	,0
)

SELECT
				POST_IDX,
				POST_CATEGORY,
				TITLE,
				CONTENTS,
				STATUS,
				REG_DATE,
				POST_WITER
			FROM 
				POST
			WHERE
				STATUS = 'N'
			ORDER BY POST_IDX DESC 

