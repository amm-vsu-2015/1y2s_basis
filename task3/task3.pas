program Project1;

{$APPTYPE CONSOLE}
{
  Задача:
  На вход поступает текстовый файл, заполненный строками.
  Необходимо перенести все знаки препинания в конец каждый строки.

  Входные данные: файл input.txt
}
uses
  SysUtils;


type
  Stack = ^st;
  st = record
    value: char;
    next: Stack;
  end;

procedure push(var head: Stack; sym: Char);
var st: Stack;
begin
  new(st);
  st^.value := sym;
  st^.next := head;
  head := st;
end;

function pop(var head: Stack): Stack;
var st: Stack;
begin
  st := nil;
  if (head <> nil) then
    begin
      st := head;
      head := head^.next;
      st^.next := nil;
    end;
  pop:= st;
end;

function appendToString(var head: Stack; resString: String): String;
var cloneStk: Stack;
begin
  if (head <> nil) then begin
    cloneStk := head;
    repeat
      resString := resString + cloneStk^.value;
      cloneStk := cloneStk^.next;
    until(cloneStk = nil);
  end;
  appendToString := resString;
end;

var
  fin, fout: Text;
  i: Integer;
  stk, head: Stack;
  charSet: set of Char;
  readString, writeString: String;
begin

  i := 0;
  readString := '';
  charSet := ['.', ',', ':', ';', '!', '?', '-'];

  assign(fin, 'input.txt');
  assign(fout, 'output.txt');

  reset(fin);
  rewrite(fout);

  writeln('start...');

  while NOT(EOF(fin)) do begin
    stk := nil;
    writeString := '';
    readln(fin, readString);
    if (length(readString) > 0) then begin
      for i := 1 to length(readString) do begin
        if (readString[i] in charSet) then
          push(stk, readString[i])
        else
          writeString := writeString + readString[i];
      end;

      writeString := appendToString(stk, writeString);
      {
        writeln;
        write('read:   ');
        writeln(readString);
        write('result: ');
        writeln(writeString);
      }
      writeln(fout, writeString);
    end;
  end;

  writeln;
  writeln;

  writeln(' [##] Input.txt file: ');

  readString := '';
  close(fin);
  reset(fin);
  while NOT(EOF(fin)) do begin
    readln(fin, readString);
    writeln('[input.txt]: ', readString);
  end;


  writeln;
  writeln;

  writeln(' [##] Output.txt file: ');
  readString := '';
  close(fout);
  reset(fout);
  while NOT(EOF(fout)) do begin
    readln(fout, readString);
    writeln('[output.txt]: ', readString);
  end;


  close(fin);
  close(fout);
  readln;

end.
