rem tasm /x /m /ml /l /D_TASM_ winpad95.asm
rem tlink32 /Tpe /aa /c winpad95.obj,,,,stub.def,winpad95.res
tasm32 /x /m /ml /l /D_TASM_ shympler.asm
tlink32 /Tpe /aa /c shympler.obj,,,,stub.def,shympler.m.res
del shympler.tasm.exe
ren shympler.EXE shympler.tasm.exe
