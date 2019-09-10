create table result     (name text, is_builtin text, categoly text);
create table list       (name text);
create table not_builtin(name text);
create table builtin    (name text);
create table aggregate  (name text);
create table core       (name text);
create table date       (name text);
create table window     (name text);

.import 'sql_fn_list.txt'        'list'
.import 'sql_fn_not_builtin.txt' 'not_builtin'
.import 'sql_fn_builtin.txt'     'builtin'
.import 'sql_fn_aggregate.txt'   'aggregate'
.import 'sql_fn_core.txt'        'core'
.import 'sql_fn_date.txt'        'date'
.import 'sql_fn_window.txt'      'window'

insert into result 
  select
    list.name,
    list.name in (select * from builtin),
    case 
      when list.name in (select * from aggregate) then 'aggregate'
      when list.name in (select * from core)      then 'core'
      when list.name in (select * from date)      then 'date'
      when list.name in (select * from window)    then 'window'
    end
  from list;

.mode tabs
.headers on
.output sql_fn_result.tsv
select * from result;
.output sql_fn_null_categoly_result.tsv
select * from result where categoly is NULL;
.output stdout

