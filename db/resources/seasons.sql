declare i integer
set i = 1
while i <= 8
begin
  insert into seasons (serial_id, is_full, created_at, updated_at) values (1, true, current_timestamp, current_timestamp)
  set i = i + 1
end;
