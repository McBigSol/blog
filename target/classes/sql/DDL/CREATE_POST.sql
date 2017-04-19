create table post
(
	post_idx int not null auto_increment,
	post_category int not null,
	title varchar(100) not null,
	contents varchar(4000) not null,
	status varchar(1) not null default 'N',
	reg_date timestamp not null default current_timestamp on update current_timestamp,
	post_witer int not null default 0,
	primary key(post_idx)
);


