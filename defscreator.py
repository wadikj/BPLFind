s='''VER360	Delphi 12.0 Athens / C++Builder 12.0 Athens	23.0	290	36.0
VER350	Delphi 11.0 Alexandria / C++Builder 11.0 Alexandria	22.0	280	35.0
VER340	Delphi 10.4 Sydney / C++Builder 10.4 Sydney	21.0	270	34.0
VER330	Delphi 10.3 Rio / C++Builder 10.3 Rio	20.0	260	33.0
VER320	Delphi 10.2 Tokyo / C++Builder 10.2 Tokyo	19.0	250	32.0
VER310	Delphi 10.1 Berlin / C++Builder 10.1 Berlin	18.0	240	31.0
VER300	Delphi 10 Seattle / C++Builder 10 Seattle	17.0	230	30.0
VER290	Delphi XE8 / C++Builder XE8	16.0	220	29.0
VER280	Delphi XE7 / C++Builder XE7	15.0	210	28.0
VER270	Delphi XE6 / C++Builder XE6	14.0	200	27.0
VER260	Delphi XE5 / C++Builder XE5	12.0	190	26.0
VER250	Delphi XE4 / C++Builder XE4	11.0	180	25.0
VER240	Delphi XE3 / C++Builder XE3	10.0	170	24.0
VER230	Delphi XE2 / C++Builder XE2	9.0	160	23.0
VER220	Delphi XE / C++Builder XE	8.0	150	22.0
VER210	Delphi 2010 / C++Builder 2010	7	140	21.0
VER200	Delphi 2009 / C++Builder 2009	6	120	20.0
VER190	Delphi 2007 for .Net [1]	5	110	19.0
VER180 	Delphi 2007 / C++Builder 2007 	5	110	18.5
VER180	Delphi 2006 / C++Builder 2006	4	100	18.0
VER170	Delphi 2005	3	90	17.0
VER160	Delphi 8 for .Net	2	80	16.0
VER150	Delphi 7 (and 7.1)	NA	70	15.0
VER140	Delphi 6 / C++Builder 6	NA	60	14.0'''

l = s.split('\n')

i = 0
for s in l:
    v = s.split('\t')
    print('{$IFDEF '+ v[0]+ '}')
    print('  CurrentCompiler = ' + str(i)+';')
    print('{$ENDIF}')
    i += 1

print ('Total ', i, ' items');

for s in l:
    v = s.split('\t');
    print("    (Name: '{0}'; ProductVer: '{1}'; PkgVer: {2}; CompilerVer: {3}),".format(v[1], v[2], v[3][0:-1], v[4][0:2]+'0' ))
    
