unit misrutinas;
{$mode objfpc}{$H+}
interface
  procedure cuadro(X,Y,tamano,color:integer);
  procedure EscribirTexto(X,Y,Dir,tamano,color:integer;texto:string);
  procedure Modografico;
implementation
uses
  Classes, SysUtils, Graph, crt;
procedure cuadro(X,Y,tamano,color:integer);
var
  margen:integer;
begin
  // Cuadrado exterior
  SetColor(color);
  Rectangle(x,y,x+tamano-1,y+tamano-1);
  //Cuadrado interior
  SetFillStyle(SolidFill,color);
  margen:=tamano div 10+1;
  Bar(x+margen-1,y+margen-1,x+tamano-margen-1,y+tamano-margen-1);
end;
procedure EscribirTexto(X,Y,Dir,tamano,color:integer;texto:string);
begin
  Setcolor(Color);
  Settextstyle(0,Dir,tamano);
  OuttextXY(X,Y,texto);
end;
// Iniciar el modo grafico
procedure Modografico;
var
  gm,gd:smallint;
  pathtodriver:string;
begin
 gd:=detect;
 gm:=0;
 InitGraph(gd,gm,PathToDriver);
end;
function inkey:char;
begin
 if keypressed then Inkey:=readkey
 else Inkey:=#255;
end;

end.

