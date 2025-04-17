select *
from information_schema.columns
;

create table test_1 (

	col_1 text
	, col_2 int
);

alter table test_1 
add column col_3 text;

alter table test_1 
rename column col_3 to col_4
;
alter table test_1 
drop column col_4
;
insert into test ( col_1, col_2)
values ('text', 1)
;
create table text_copy_1 as
select * from test_1
;
drop table text_copy_1
;
drop table test_1

