unit u_consts;

interface

const

{$IFDEF VER360}
  CurrentCompiler = 0;
{$ENDIF}
{$IFDEF VER350}
  CurrentCompiler = 1;
{$ENDIF}
{$IFDEF VER340}
  CurrentCompiler = 2;
{$ENDIF}
{$IFDEF VER330}
  CurrentCompiler = 3;
{$ENDIF}
{$IFDEF VER320}
  CurrentCompiler = 4;
{$ENDIF}
{$IFDEF VER310}
  CurrentCompiler = 5;
{$ENDIF}
{$IFDEF VER300}
  CurrentCompiler = 6;
{$ENDIF}
{$IFDEF VER290}
  CurrentCompiler = 7;
{$ENDIF}
{$IFDEF VER280}
  CurrentCompiler = 8;
{$ENDIF}
{$IFDEF VER270}
  CurrentCompiler = 9;
{$ENDIF}
{$IFDEF VER260}
  CurrentCompiler = 10;
{$ENDIF}
{$IFDEF VER250}
  CurrentCompiler = 11;
{$ENDIF}
{$IFDEF VER240}
  CurrentCompiler = 12;
{$ENDIF}
{$IFDEF VER230}
  CurrentCompiler = 13;
{$ENDIF}
{$IFDEF VER220}
  CurrentCompiler = 14;
{$ENDIF}
{$IFDEF VER210}
  CurrentCompiler = 15;
{$ENDIF}
{$IFDEF VER200}
  CurrentCompiler = 16;
{$ENDIF}
{$IFDEF VER190}
  CurrentCompiler = 17;
{$ENDIF}
{$IFDEF VER180 }
  CurrentCompiler = 18;
{$ENDIF}
{$IFDEF VER180}
  CurrentCompiler = 19;
{$ENDIF}
{$IFDEF VER170}
  CurrentCompiler = 20;
{$ENDIF}
{$IFDEF VER160}
  CurrentCompiler = 21;
{$ENDIF}
{$IFDEF VER150}
  CurrentCompiler = 22;
{$ENDIF}
{$IFDEF VER140}
  CurrentCompiler = 23;
{$ENDIF}

type
  TCompilerData = record
    Name:string;
    ProductVer:string;
    PkgVer:Integer;
    CompilerVer:Integer;
  end;

const
  CompilerData : array [0..23] of TCompilerData = (
    (Name: 'Delphi 12.0 Athens / C++Builder 12.0 Athens'; ProductVer: '23.0'; PkgVer: 29; CompilerVer: 360),
    (Name: 'Delphi 11.0 Alexandria / C++Builder 11.0 Alexandria'; ProductVer: '22.0'; PkgVer: 28; CompilerVer: 350),
    (Name: 'Delphi 10.4 Sydney / C++Builder 10.4 Sydney'; ProductVer: '21.0'; PkgVer: 27; CompilerVer: 340),
    (Name: 'Delphi 10.3 Rio / C++Builder 10.3 Rio'; ProductVer: '20.0'; PkgVer: 26; CompilerVer: 330),
    (Name: 'Delphi 10.2 Tokyo / C++Builder 10.2 Tokyo'; ProductVer: '19.0'; PkgVer: 25; CompilerVer: 320),
    (Name: 'Delphi 10.1 Berlin / C++Builder 10.1 Berlin'; ProductVer: '18.0'; PkgVer: 24; CompilerVer: 310),
    (Name: 'Delphi 10 Seattle / C++Builder 10 Seattle'; ProductVer: '17.0'; PkgVer: 23; CompilerVer: 300),
    (Name: 'Delphi XE8 / C++Builder XE8'; ProductVer: '16.0'; PkgVer: 22; CompilerVer: 290),
    (Name: 'Delphi XE7 / C++Builder XE7'; ProductVer: '15.0'; PkgVer: 21; CompilerVer: 280),
    (Name: 'Delphi XE6 / C++Builder XE6'; ProductVer: '14.0'; PkgVer: 20; CompilerVer: 270),
    (Name: 'Delphi XE5 / C++Builder XE5'; ProductVer: '12.0'; PkgVer: 19; CompilerVer: 260),
    (Name: 'Delphi XE4 / C++Builder XE4'; ProductVer: '11.0'; PkgVer: 18; CompilerVer: 250),
    (Name: 'Delphi XE3 / C++Builder XE3'; ProductVer: '10.0'; PkgVer: 17; CompilerVer: 240),
    (Name: 'Delphi XE2 / C++Builder XE2'; ProductVer: '9.0'; PkgVer: 16; CompilerVer: 230),
    (Name: 'Delphi XE / C++Builder XE'; ProductVer: '8.0'; PkgVer: 15; CompilerVer: 220),
    (Name: 'Delphi 2010 / C++Builder 2010'; ProductVer: '7'; PkgVer: 14; CompilerVer: 210),
    (Name: 'Delphi 2009 / C++Builder 2009'; ProductVer: '6'; PkgVer: 12; CompilerVer: 200),
    (Name: 'Delphi 2007 for .Net [1]'; ProductVer: '5'; PkgVer: 11; CompilerVer: 190),
    (Name: 'Delphi 2007 / C++Builder 2007 '; ProductVer: '5'; PkgVer: 11; CompilerVer: 180),
    (Name: 'Delphi 2006 / C++Builder 2006'; ProductVer: '4'; PkgVer: 10; CompilerVer: 180),
    (Name: 'Delphi 2005'; ProductVer: '3'; PkgVer: 9; CompilerVer: 170),
    (Name: 'Delphi 8 for .Net'; ProductVer: '2'; PkgVer: 8; CompilerVer: 160),
    (Name: 'Delphi 7 (and 7.1)'; ProductVer: 'NA'; PkgVer: 7; CompilerVer: 150),
    (Name: 'Delphi 6 / C++Builder 6'; ProductVer: 'NA'; PkgVer: 6; CompilerVer: 140)
    );

implementation


{ fr 4

fqb
frx
frxADO
frxBDE
FRXCS
frxDB
frxDBX
FRXE
frxFib
frxIBO
frxIBX
frxTee
fs
fsADO
fsBDE
fsDB
fsIBX
fsTee
fsx

}

{fr 5

frx
frxDB
frxIBO
frxTee
frxADO
frxBDE
frxCS
frxDBX
frxe
frxfib
frxfd
frxibx
fs
fsADO
fsBDE
fsDB
fsIBX
fsTee
fsx
fqb
}


{fr6

frx
frxDB
frxIBO
frxIntIO
frxIntIOBase
frxIntIOIndy
frxTee
frxibx
frxIBO
frxFD
frxFIB
frxe
frxdbx
frxcs
frxbde
frxado
fs
fsADO
fsBDE
fsDB
fsFD
fsIBX
fsTee
fsx
fqb

}

end.
