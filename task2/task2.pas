program pract_6;

{$APPTYPE CONSOLE}
{
  Задача:
  Дан двунаправленынй линейный список с целочисленными элементами.
  Вставить перед каждым элементом с положительным значением элемент со значением 25.
  Удалить все элементы с отрицательными значениями.
}

uses
  SysUtils;

type
  pointer = ^node;

  node = record
    value: integer;
    prev, next: pointer;
  end;

var
  head, prev, list, last: pointer;
  i, amount, buffer: integer;
begin

write('amount : ');
readln(amount);

prev := nil;
head := nil;
list := nil;

for i:=1 to amount do begin
  prev := list;

  new(list);

  write('write num: ');
  readln(buffer);

  if (head = nil) then begin
    head := list;
    head^.next := list;
    head^.prev := nil;
  end else begin
    prev^.next := list;
    list^.prev := prev;
  end;

  list^.value := buffer;
end;

last := list;

list := head;

while (list <> nil) do begin
  writeln(list^.value);
  list := list^.next;
end;


writeln;

list := last;

while (list <> nil) do begin
  writeln(list^.value);
  list := list^.prev;
end;



list := head;

repeat
  if (list^.value < 0) then begin
    if (list^.prev <> nil) then list^.prev^.next := list^.next;
    if (list^.next <> nil) then list^.next^.prev := list^.prev;

    if (list = head) then
      if (list^.next <> nil) then head := list^.next
      else if (list^.prev <> nil) then head := list^.prev
      else begin
        head := nil;
        break;
      end;
  end;
  list := list^.next;
until (list = nil);

list := head;

while (list <> nil) do begin
  if (list^.value > 0) then begin
    prev := list;
    new(list);
    list^.value := 25;

    list^.next := prev;
    list^.prev := prev^.prev;
    if (prev = head) then begin
      head := list;
    end else begin
      prev^.prev^.next := list;
      prev^.prev := list;
    end;
    list := prev;
  end;
  list := list^.next;
end;

writeln;

list := head;

if (head <> nil) then begin
  while (list <> nil) do begin
    writeln(list^.value);
    list := list^.next;
  end;
end else begin
  writeln('list was delete');
end;




readln;
end.
