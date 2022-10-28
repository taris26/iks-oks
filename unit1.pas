unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  ExtCtrls, Types;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
  private
    procedure Potez1(a:char);
    procedure Potez2(a:char);
    procedure Provera(x,y:integer);
  public

  end;

var
  Form1: TForm1;
  i:integer=0;
  a3,a2,t1,x1,y1:integer;
  o,p:char;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Potez1(a:char);
var j,m:integer;
begin
  t1:=0;
  j:=0;
     while (j<3)and(t1=0) do begin
             m:=0;
             while (m<3)and(t1=0) do begin
                   if StringGrid1.Cells[j,m]='' then begin
                      StringGrid1.Cells[j,m]:=a;
                      provera(j,m);
                      if a3>0 then begin
                         StringGrid1.Cells[j,m]:=o;
                         t1:=1;
                         x1:=j;
                         y1:=m;
                         Provera(j,m);
                         if a3>0 then begin
                            ShowMessage('Izgubili ste');
                            i:=0;
                            label2.caption:=IntToStr(StrToInt(label2.caption)+1);
                         end;
                      end
                      else StringGrid1.Cells[j,m]:='';
                   end;
                   m:=m+1;
             end;
             j:=j+1;
       end;
end;

procedure TForm1.Potez2(a:char);
var j,m:integer;
begin
  t1:=0;
  j:=0;
     while (j<3)and(t1=0) do begin
             m:=0;
             while (m<3)and(t1=0) do begin
                   if StringGrid1.Cells[j,m]='' then begin
                      StringGrid1.Cells[j,m]:=a;
                      provera(j,m);
                      if a2>1 then begin
                         StringGrid1.Cells[j,m]:=o;
                         t1:=1;
                         x1:=j;
                         y1:=m;
                         Provera(j,m);
                         if a2>1 then begin
                            ShowMessage('Izgubili ste');
                            i:=0;
                            label2.caption:=IntToStr(StrToInt(label2.caption)+1);
                         end;
                      end
                      else StringGrid1.Cells[j,m]:='';
                   end;
                   m:=m+1;
             end;
             j:=j+1;
       end;
end;

procedure TForm1.Provera(x,y:integer);
var m,n,k:integer;
    c:string;
begin
           c:=StringGrid1.Cells[x,y];
           a3:=0;
           a2:=0;
           m:=0;
           n:=0;
           k:=0;
           while m<3 do begin
             if StringGrid1.Cells[x,m]=c then n:=n+1;
             if StringGrid1.Cells[x,m]='' then k:=k+1;
             m:=m+1;
           end;
           if n=3 then a3:=a3+1;
           if (n=2)and(k=1) then a2:=a2+1;
           m:=0;
           n:=0;
           k:=0;
           while m<3 do begin
             if StringGrid1.Cells[m,y]=c then n:=n+1;
             if StringGrid1.Cells[m,y]='' then k:=k+1;
             m:=m+1;
           end;
           if n=3 then a3:=a3+1;
           if (n=2)and(k=1) then a2:=a2+1;
           if x=y then begin
             n:=0;
             m:=0;
             k:=0;
             while m<3 do begin
               if StringGrid1.Cells[m,m]=c then n:=n+1;
               if StringGrid1.Cells[m,m]='' then k:=k+1;
               m:=m+1;
             end;
             if n=3 then a3:=a3+1;
             if (n=2)and(k=1) then a2:=a2+1;
           end;
           if x+y=2 then begin
              n:=0;
              m:=0;
              k:=0;
              while m<3 do begin
                if StringGrid1.Cells[m,2-m]=c then n:=n+1;
                if StringGrid1.Cells[m,2-m]='' then k:=k+1;
                m:=m+1;
              end;
              if n=3 then a3:=a3+1;
              if (n=2)and(k=1) then a2:=a2+1;
           end;
end;

procedure TForm1.StringGrid1SelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
var k,r,t:integer;
begin
   if radiobutton6.checked then begin
     if (i mod 2=1)and(StringGrid1.Cells[aCol,aRow]='')and(i>0) then begin
       StringGrid1.Cells[aCol,aRow]:='X';
       Provera(aCol,aRow);
       if a3>0 then begin
          ShowMessage('Pobedio je X');
          label1.caption:=IntToStr(StrToInt(label1.caption)+1);
          i:=0;
       end;
       if i<>0 then i:=i+1;
       if i=10 then begin
        Provera(aCol,aRow);
        if a3=0 then begin
           ShowMessage('Nerešeno je');
           i:=0;
        end;
       end;
     end;
     if (i mod 2=0)and(StringGrid1.Cells[aCol,aRow]='')and(i>0) then begin
       StringGrid1.Cells[aCol,aRow]:='O';
       Provera(aCol,aRow);
       if a3>0 then begin
          ShowMessage('Pobedio je O');
          label2.caption:=IntToStr(StrToInt(label2.caption)+1);
          i:=0;
       end;
       if i<>0 then i:=i+1;
       if i=10 then begin
        Provera(aCol,aRow);
        if a3=0 then begin
           ShowMessage('Nerešeno je');
           i:=0;
        end;
       end;
     end;
   end;
   if (radiobutton5.checked)and(i>0) then begin
     if (StringGrid1.Cells[aCol,aRow]='') and (i>0) then begin
       StringGrid1.Cells[aCol,aRow]:=p;
       Provera(aCol,aRow);
       if a3>0 then begin
         ShowMessage('Pobedili ste');
         label1.caption:=IntToStr(StrToInt(label1.caption)+1);
         k:=1;
         i:=0;
       end;
       if i<>0 then i:=i+1;
       if k<>1 then k:=0;
       if i=6 then begin
          Provera(aCol,aRow);
          if a3=0 then begin
             k:=1;
             ShowMessage('Nerešeno je.');
             i:=0;
          end;
       end;
       if (k=0)and(radiobutton2.checked) then begin
          potez1(o);
          k:=t1;
       end;
       if k=0 then begin
          potez1(p);
          k:=t1;
       end;
       if (radiobutton2.Checked)and(k=0) then begin
           potez2(o);
           k:=t1;
           if (k=0) then begin
              potez2(p);
              k:=t1;
           end;
           if (k=0)and(StringGrid1.Cells[1,1]='') then begin
              StringGrid1.Cells[1,1]:=o;
              k:=1;
           end;
       end;
       while k=0 do begin
         randomize;
         r:=random(3)+0;
         t:=random(3)+0;
         if StringGrid1.Cells[r,t]='' then begin
           StringGrid1.Cells[r,t]:=o;
           x1:=r;y1:=t;
           k:=1;
           Provera(r,t);
           if a3>0 then begin
               ShowMessage('Izgubili ste');
               i:=0;
               label2.caption:=IntToStr(StrToInt(label2.caption)+1);
           end;
         end;
       end;
       if (radiobutton4.Checked)and(i=5) then begin
          Provera(x1,y1);
          if a3=0 then begin
             k:=1;
             ShowMessage('Nerešeno je');
             i:=0;
          end;
       end;
       end;
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var j,k:integer;
begin
  i:=1;
  j:=0;
  while j<3 do begin
    k:=0;
    while k<3 do begin
      StringGrid1.Cells[j,k]:='';
      k:=k+1;
    end;
    j:=j+1;
  end;
  if radiobutton6.checked then begin
    radiobutton3.checked:=true;
    label1.top:=48;
    label2.top:=86;
  end;
  if radiobutton3.Checked then begin o:='O'; p:='X'; end;
  if radiobutton4.Checked then begin
    o:='X'; p:='O';
    StringGrid1.Cells[1,1]:=o;
    label1.top:=86;
    label2.top:=48;
  end
  else begin
    label1.top:=48;
    label2.top:=86;
  end;
  if radiobutton6.checked then radiobutton4.checked:=false;
end;



end.

