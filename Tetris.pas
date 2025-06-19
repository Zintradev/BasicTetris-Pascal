program Tetris;
uses
   misrutinas,sysutils,graph,wincrt,windows;

type
  tipo_campo=array[0..22,0..14]of byte;

const
   tamano=30;

  campo0:tipo_campo=
   ((0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,0,0,0,0,0,0,0,0,0,0,3,0,0),
    (0,3,3,3,3,3,3,3,3,3,3,3,3,0,0),
    (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
    (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0));

   figura:array[0..6,0..3,0..3,0..3]of byte=
  ((((0,4,0,0),             {figura 1}
     (0,4,0,0),
     (0,4,0,0),
     (0,4,0,0)),
    ((0,0,0,0),
     (4,4,4,4),
     (0,0,0,0),
     (0,0,0,0)),
    ((0,4,0,0),
     (0,4,0,0),
     (0,4,0,0),
     (0,4,0,0)),
    ((0,0,0,0),
     (4,4,4,4),
     (0,0,0,0),
     (0,0,0,0))),

   (((0,6,6,0),               {figura 2}
     (0,6,0,0),
     (0,6,0,0),
     (0,0,0,0)),
    ((6,0,0,0),
     (6,6,6,0),
     (0,0,0,0),
     (0,0,0,0)),
    ((0,6,0,0),
     (0,6,0,0),
     (6,6,0,0),
     (0,0,0,0)),
    ((6,6,6,0),
     (0,0,6,0),
     (0,0,0,0),
     (0,0,0,0))),

   (((0,12,0,0),               {figura 3}
     (0,12,0,0),
     (0,12,12,0),
     (0,0,0,0)),
    ((0,0,12,0),
     (12,12,12,0),
     (0,0,0,0),
     (0,0,0,0)),
    ((12,12,0,0),
     (0,12,0,0),
     (0,12,0,0),
     (0,0,0,0)),
    ((0,0,0,0),
     (12,12,12,0),
     (12,0,0,0),
     (0,0,0,0))),

   (((0,0,0,0),               {figura 4}
     (0,9,9,0),
     (0,9,9,0),
     (0,0,0,0)),
    ((0,0,0,0),
     (0,9,9,0),
     (0,9,9,0),
     (0,0,0,0)),
    ((0,0,0,0),
     (0,9,9,0),
     (0,9,9,0),
     (0,0,0,0)),
    ((0,0,0,0),
     (0,9,9,0),
     (0,9,9,0),
     (0,0,0,0))),

   (((0,0,7,7),               {figura 5}
     (0,7,7,0),
     (0,0,0,0),
     (0,0,0,0)),
    ((0,7,0,0),
     (0,7,7,0),
     (0,0,7,0),
     (0,0,0,0)),
    ((0,0,7,7),
     (0,7,7,0),
     (0,0,0,0),
     (0,0,0,0)),
    ((0,7,0,0),
     (0,7,7,0),
     (0,0,7,0),
     (0,0,0,0))),

   (((2,2,0,0),               {figura 6}
     (0,2,2,0),
     (0,0,0,0),
     (0,0,0,0)),
    ((0,0,2,0),
     (0,2,2,0),
     (0,2,0,0),
     (0,0,0,0)),
    ((2,2,0,0),
     (0,2,2,0),
     (0,0,0,0),
     (0,0,0,0)),
    ((0,0,2,0),
     (0,2,2,0),
     (0,2,0,0),
     (0,0,0,0))),

   (((0,3,0,0),               {figura 7}
     (3,3,3,0),
     (0,0,0,0),
     (0,0,0,0)),
    ((0,3,0,0),
     (3,3,0,0),
     (0,3,0,0),
     (0,0,0,0)),
    ((3,3,3,0),
     (0,3,0,0),
     (0,0,0,0),
     (0,0,0,0)),
    ((3,0,0,0),
     (3,3,0,0),
     (3,0,0,0),
     (0,0,0,0))));

var
  c,k:char;
  i,j,ficha,fila,siguiente:byte;
  X,Y,contador,posicion,velocidad,puntos,nivel,subnivel,numfilas:integer;
  campo1:tipo_campo;

procedure PintarCampo(var campo1:tipo_campo);
var
  fila,columna:byte;
begin
  for fila:=0 to 22 do
      for columna:=0 to 14 do
          //if campo1[fila,columna]<> 0 then
          cuadro(columna*tamano,fila*tamano,tamano,campo1[fila,columna]);
end;

procedure PintarFigura(X,Y,tamano,la_figura,la_posicion,negro:byte);
var
  fila,columna:byte;
begin
     for fila:=0 to 3 do
         for columna:=0 to 3 do
             if figura[la_figura,la_posicion,fila,columna]<> 0 then
            cuadro((X+columna)*tamano,(Y+fila)*tamano,tamano,negro*figura[la_figura,la_posicion,fila,columna]);
end;

function Colision(X,Y,la_ficha,la_posicion:byte):boolean;
var
  fila,columna:byte;
  begin
       Colision:=false;
       for fila:=0 to 3 do
         for columna:=0 to 3 do
             if figura[la_ficha,la_posicion,fila,columna]<> 0 then
                if campo1[Y+fila,X+columna]<>0 then Colision:=true;
  end;


procedure FijarFigura(X,Y,la_ficha,la_posicion:byte);
var
  fila,columna:byte;
  begin
       for fila:=0 to 3 do
         for columna:=0 to 3 do
             if figura[la_ficha,la_posicion,fila,columna]<> 0 then
                campo1[Y+fila,X+columna]:=figura[la_ficha,la_posicion,fila,columna];

  end;

function FilaCompleta(fila:byte):boolean;
var
  columna:byte;
begin
     FilaCompleta:=true;
     for columna:= 2 to 11 do
        if campo1[fila,columna]=0 then FilaCompleta:=False;
end;

procedure BajarFilas(fila:byte);
var
  j:byte;
begin
     for j:=fila downto 1 do
       campo1[j]:=campo1[j-1];
end;

procedure ComprobarFilas;
var
  fila,filas_completas:byte;
begin
     fila:=19;
     filas_completas:=0;
     repeat
        if FilaCompleta(fila) then
             begin
               BajarFilas(fila);
               PintarCampo(campo1);
               filas_completas:=filas_completas+1;
               numfilas:=numfilas+1;
             end
        else
            fila:=fila-1;
     until fila=1;
     EscribirTexto(1000,500,0,5,0,IntToStr(subnivel));
     EscribirTexto(800,50,0,5,0,IntToStr(puntos));
     EscribirTexto(1000,300,0,5,0,IntToStr(nivel));

     if filas_completas=1 then puntos:=puntos+15;

     if filas_completas>1 then puntos:=puntos+30;

     EscribirTexto(800,50,0,5,15,IntToStr(puntos));

     if filas_completas=(1 or 2 or 3 or 4 or 5) then
         begin
            numfilas:=numfilas+1;
            if numfilas DIV 10=2 then
               begin
                 nivel:=nivel+1;
                 subnivel:=0;
               end;
         end;

     EscribirTexto(1000,300,0,5,15,IntToStr(nivel));

     if filas_completas=1 then subnivel:=subnivel+1;

     if filas_completas=2 then subnivel:=subnivel+2;

     if filas_completas>2 then subnivel:=subnivel+5;

     EscribirTexto(1000,500,0,5,15,IntToStr(subnivel));

     if filas_completas=1 then velocidad:=velocidad-10;

end;

function Inkey:char;
begin
     if Keypressed then Inkey:=Readkey else Inkey:=#255;
end;

procedure menu;
begin
   cleardevice;
     EscribirTexto(20,5,0,4,2,'-------------');
     EscribirTexto(15,10,0,4,2,'-');
     EscribirTexto(15,15,0,4,2,'-');
     EscribirTexto(15,20,0,4,2,'-');
     EscribirTexto(15,25,0,4,2,'-');
     EscribirTexto(15,30,0,4,2,'-');
     EscribirTexto(15,35,0,4,2,'-');
     EscribirTexto(15,40,0,4,2,'-');
     EscribirTexto(15,45,0,4,2,'-');
     EscribirTexto(15,50,0,4,2,'-');
     EscribirTexto(15,55,0,4,2,'-');
     EscribirTexto(15,60,0,4,2,'-');
     EscribirTexto(15,65,0,4,2,'-');
     EscribirTexto(15,70,0,4,2,'-');
     EscribirTexto(15,75,0,4,2,'-');
     EscribirTexto(15,80,0,4,2,'-');
     EscribirTexto(400,10,0,4,2,'-');
     EscribirTexto(400,15,0,4,2,'-');
     EscribirTexto(400,20,0,4,2,'-');
     EscribirTexto(400,25,0,4,2,'-');
     EscribirTexto(400,30,0,4,2,'-');
     EscribirTexto(400,35,0,4,2,'-');
     EscribirTexto(400,40,0,4,2,'-');
     EscribirTexto(400,40,0,4,2,'-');
     EscribirTexto(400,45,0,4,2,'-');
     EscribirTexto(400,50,0,4,2,'-');
     EscribirTexto(400,55,0,4,2,'-');
     EscribirTexto(400,60,0,4,2,'-');
     EscribirTexto(400,65,0,4,2,'-');
     EscribirTexto(400,70,0,4,2,'-');
     EscribirTexto(400,75,0,4,2,'-');
     EscribirTexto(400,80,0,4,2,'-');
     EscribirTexto(50,40,0,4,2,'T E T R I S');
     EscribirTexto(20,80,0,4,2,'-------------');
     EscribirTexto(20,120,0,4,2,'1-J U G A R');
     EscribirTexto(20,160,0,4,2,'2-C O N T R O L E S');
     EscribirTexto(20,200,0,4,2,'3-H I S T O R I A');
     EscribirTexto(20,240,0,4,2,'4-S A L I R');
end;

procedure Controles;
begin
      Cleardevice;
      EscribirTexto(20,5,0,6,6,'CONTROLES');
      EscribirTexto(20,60,0,3,6,'----"O" para mover izquierda....');
      EscribirTexto(20,120,0,3,6,'----"P" pra mover derecha....');
      EscribirTexto(20,180,0,3,6,'----"D" para cambiar la poscion....');
      EscribirTexto(20,240,0,3,6,'----"T" para pausar....');
      EscribirTexto(20,300,0,3,6,'----"A" para bajar la pieza rapidamente');
      EscribirTexto(20,360,0,3,6,'----La siguiente pieza aparecera a la derecha....');
      EscribirTexto(20,420,0,3,6,'----Subira de velocidad al conseguir romper filas....');
      EscribirTexto(20,480,0,3,6,'----Cada fila subira un nivel y por consiguiente la dificultad');
      EscribirTexto(20,540,0,3,6,'----En caso de hacer 2filas se suamara 2 niveles y en caso de mas de 2 se suamra 5');
      EscribirTexto(20,600,0,3,6,'----Al hacer varias filas la velocidad aumentara como una sola asi  que aprovechalo');
      readkey;
end;

procedure Historia;
begin
     cleardevice;
      EscribirTexto(20,5,0,6,12,'HISTORIA');
      EscribirTexto(20,60,0,2,12,'La historia del Tetris proviene del matematico ruso');
      EscribirTexto(20,110,0,2,12,'quien era un aficionado de los rompecabezas y al principio su intencion era crear');
      EscribirTexto(20,160,0,2,12,'un juego similar para uno o varios jugadores');
      EscribirTexto(20,210,0,2,12,'Con el objetivo de encajar piezas geometricas');
      EscribirTexto(20,260,0,2,12,'formadas por 5 cuadros en una caja de madera.');
      EscribirTexto(20,310,0,2,12,'Mientras creaba el Juego Alexei imaginaba que sus piezas caian en un vaso');
      EscribirTexto(20,360,0,2,12,'y que los jugadores podian moverlas para ambos lados y hasta rotarlas');
      EscribirTexto(20,410,0,2,12,'para asi crear formas completas');
      EscribirTexto(20,460,0,2,12,'Pero el juego termino siendo muy dificil');
      EscribirTexto(20,510,0,2,12,'asi que tomo la decision de simplificar las piezas por figuras de 4 cuadrados');
      EscribirTexto(20,560,0,2,12,'con el nombre de Tetrominos. El nombre del juego viene');
      EscribirTexto(20,610,0,2,12,'de la combinación de Tetra en griego, que es cuatro');
      EscribirTexto(20,660,0,2,12,'y aparte su deporte favorito de Alexei era el tenis.');
      readkey;
end;

procedure Juego;
begin
  cleardevice;
  EscribirTexto(150,60,0,6,45,'Elija dificultad');
  EscribirTexto(150,90,0,6,45,'----------------');
  EscribirTexto(150,240,0,4,45,'1-Facil');
  EscribirTexto(150,420,0,4,45,'2-Medio');
  EscribirTexto(150,600,0,4,45,'3-Dificil');
  k:=readkey;
  Case k of
  '1': velocidad:=250;
  '2': velocidad:=150;
  '3': velocidad:=100;
  end;
  cleardevice;
  campo1:=campo0;
  PintarCampo(campo1);
  Randomize;
  //Para la velocidad
  contador:=0;
  //Primera ficha y ficha siguiente
  ficha:=random(7);
  siguiente:=Random(7);
  PintarFigura(40,5,tamano,siguiente,0,1);
  Y:=-4;
  X:=5;
  posicion:=Random(4);
  fila:=19;
  EscribirTexto(500,50,0,5,15,'Puntos:');
  EscribirTexto(500,150,0,5,15,'Siguiente pieza:');
  EscribirTexto(500,300,0,5,15,'Nivel:');
  EscribirTexto(500,500,0,5,15,'Subivel:');
  repeat
       repeat
            PintarFigura(X,Y,tamano,ficha,posicion,1);//Pinta la figura
            //Movimiento de las fichas con las teclas
            c:=UpCase(InKey);
            //Mover ficha a la derecha
            if (c='P') and (Colision(X+1,Y,ficha,posicion)=false) then
               begin
                  PintarFigura(X,Y,tamano,ficha,posicion,0);
                  X:=X+1;
                  PintarFigura(X,Y,tamano,ficha,posicion,1);
               end;

            //Mover ficha a la izquierda
            if (c='O') and (Colision(X-1,Y,ficha,posicion)=false) then
               begin
                  PintarFigura(X,Y,tamano,ficha,posicion,0);
                  X:=X-1;
                  PintarFigura(X,Y,tamano,ficha,posicion,1);
               end;
            //Giro horario
            if  (c='D') and (Colision(X,Y,ficha,(posicion+1)MOD 4)=false) then
               begin
                  PintarFigura(X,Y,tamano,ficha,posicion,0);
                  posicion:=(posicion+1)MOD 4;
                  PintarFigura(X,Y,tamano,ficha,posicion,1);
               end;
            //Bajada
            if  (c='A') and (Colision(X,Y+1,ficha,posicion)=false) then
               begin
                  PintarFigura(X,Y,tamano,ficha,posicion,0);
                  Y:=Y+1;
                  PintarFigura(X,Y,tamano,ficha,posicion,1);
               end;
            if  c='T' then
              begin
                    EscribirTexto(4*tamano,10*tamano,0,(tamano div 10)+1,14,'P A U S A');
                    EscribirTexto(20,350,0,(tamano div 10)+1,14,'Pulse cualquier tecla');
                    readkey;
                    EscribirTexto(4*tamano,10*tamano,0,(tamano div 10)+1,0,'P A U S A');
                    EscribirTexto(20,350,0,(tamano div 10)+1,0,'Pulse cualquier tecla');
                    PintarCampo(campo1);
              end;
            //Bajada automatica de la pieza
            contador:=(contador+1) MOD velocidad;
            if contador=0 then
               begin
                 if Colision(X,Y+1,ficha,posicion)=false then
                    begin
                 PintarFigura(X,Y,tamano,ficha,posicion,0);//Borra la figura
                 Y:=Y+1;//Nueva coordenada de Y para la pieza
                 end
                 //Si hay colision al bajar la pieza
                 else
                    begin
                       PintarFigura(X,Y,tamano,ficha,posicion,1); //Pintar la figura
                       FijarFigura(X,Y,ficha,posicion); //Fijar la figura en el campo
                       // Comprobar si hay filas completas
                       ComprobarFilas;
                       //Borrar siguiente
                       PintarFigura(40,5,tamano,siguiente,0,0);
                       Ficha:=siguiente;
                       siguiente:=random(7);
                       PintarFigura(40,5,tamano,siguiente,0,1);;
                       X:=5; Y:=-4;
                       posicion:=Random(4);
                    end;
               end;
       until Colision(X,Y+1,ficha,posicion);
  until (Y<=0); //La pieza no puede bajar,se queda fija arriba

  EscribirTexto(4*tamano,10*tamano,0,(tamano div 10)+1,14,'F I N');
  Readkey;
  Readkey;
  CloseGraph;
end;

begin
  Modografico;
  repeat
  Menu;
  k:=readkey;
  Case k of
  '1': juego;
  '2': controles;
  '3': historia;
  end;
  until k='4';
end.

