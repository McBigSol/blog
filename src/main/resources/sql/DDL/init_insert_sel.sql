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

select
	 post_idx
	,post_category
	,title
	,contents
	,status
	,reg_date
	,post_witer
from post

