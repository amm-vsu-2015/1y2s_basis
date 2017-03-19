program pract_5;

{$APPTYPE CONSOLE}
{
  Задача:
  Найти среднее арифметическое значение всех элементов списка, которые больше 4.
}

uses
  SysUtils;

  type
    Pointer = ^node;
    node = record
      value: integer;
      next: Pointer;
    end;

var
  list, prev, head: Pointer;
  i, j, count: integer;
  tmp, sum: integer;
  avg: real;
begin

  i:=0;
  tmp:=0;
  head := nil;
  list := nil;

  write(' how many elements write to the list? (write number) ');
  readln(count);

  for i:=0 to count-1 do begin
    prev := list;

    new(list);

    if (head = nil) then begin
      head := list;
    //  prev := head;
    end else begin
      prev^.next := list;
    end;

    write('value : ');
    readln(tmp);

    list^.value := tmp;
    list^.next := head;

  end;

  list := head;
  writeln;
  writeln('output');

  repeat
    writeln('-> ', list^.value);
    list := list^.next;
  until(list = head);

  list := head;
  writeln;
  writeln(' summary : ');

  j := 0;
  repeat
    j := j + 1;
    if (j >= 5) then sum := sum + list^.value;
    list := list^.next;
  until(list = head);


    if (sum < 1) then
    begin
      writeln('sum not 5');
    end else begin
      avg := sum / (j-4);
      writeln(avg:3:2);
    end;

  readln;
end.
