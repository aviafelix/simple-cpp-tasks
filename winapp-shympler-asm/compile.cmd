call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvars32.bat"
:: ml /EHsc /utf-8 main1.cpp /link /out:main1-x86.exe
:: /coff
rem ml /c /Zd shympler.asm /link /out:shympler.masm.exe
ml /c /Zd shympler.asm
Link shympler.obj /SUBSYSTEM:WINDOWS /entry:start /LIBPATH:tasmlib /nodefaultlib user32.lib kernel32.lib comdlg32.lib rex.lib shell32.lib gdi32.lib /STUB:mystub.exe /MANIFESTFILE:xpmanifest.xml /ASSEMBLYRESOURCE:shympler.m.res /out:shympler.masm.exe
:: ml /c /Zd /coff shympler.asm /link /SUBSYSTEM:WINDOWS /entry:start /LIBPATH:tasmlib /STUB:mystub.exe /MANIFESTFILE:xpmanifest.xml /ASSEMBLYRESOURCE:shympler.m.res /out:shympler.masm.exe

:: tasm32 /x /m /ml /l /D_TASM_ shympler.asm
:: tlink32 /Tpe /aa /c shympler.obj,,,,stub.def,shympler.m.res
:: del shympler.masm.exe
:: ren shympler.EXE shympler.masm.exe
