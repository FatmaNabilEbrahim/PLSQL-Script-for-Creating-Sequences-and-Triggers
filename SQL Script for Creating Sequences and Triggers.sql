Declare 

cursor c_seq_Drop 
is 
SELECT sequence_name
    FROM USER_SEQUENCES  ; 


cursor c_trigg_Drop 
is 
select trigger_name 
from user_triggers  ;


cursor c_adding is 

select us_con_col.table_name , us_con_col.column_name 
from user_constraints  usr_con  join user_cons_columns  us_con_col
on usr_con.constraint_name = us_con_col.constraint_name  and usr_con.table_name= us_con_col.table_name
 join  user_TAB_COLUMNS usr_tab_col
  ON  us_con_col.COLUMN_NAME = usr_tab_col.column_name  and us_con_col.table_name = usr_tab_col.table_name 
where usr_con.constraint_type = 'P'  and usr_tab_col.data_type='NUMBER' ;

v_max number;
v_table_seq varchar2(100);


begin 

/*for trigg in c_trigg_Drop
loop
  --EXECUTE IMMEDIATE ( ' drop trigger  '|| trigg.trigger_name );
  END LOOP;   */     
  
  
For seq In c_seq_Drop
Loop 
  EXECUTE IMMEDIATE ( 'drop sequence '|| seq.sequence_name );
  END LOOP;




For table_rec in c_adding 
loop 
Execute immediate 
  ' select NVL(max('||table_rec.column_name||'),0)+1  from '||  table_rec.table_name into v_max;

v_table_seq:=table_rec.table_name||'_seq';

Execute immediate 
' create sequence '|| v_table_seq ||
' start with '|| v_max||
' increment by  1' ;

Execute immediate
 ' create or replace trigger '|| table_rec.table_name||'_trig' ||
 ' before insert on '|| table_rec.table_name||
' for each row 
begin'|| ' :new.'||table_rec.column_name||':='||v_table_seq || '.nextval ;  ' || ' end; ' ;


end loop;

end;




--select * from user_triggers;
--select * from user_sequences;