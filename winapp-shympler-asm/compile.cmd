call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvars32.bat"
:: rc shympler.rc
:: dumpbin /EXPORTS rex.dll > rex.exports
:: dumpbin /EXPORTS kernel32.dll > kernel32.exports
:: Polib dll\rex.dll /nound /MACHINE:X86 /DEF:rex.def /out:libs\rex.lib
:: Polib dll\rex.dll /MACHINE:X86 /DEF:rex.def /out:libs\rex.lib
:: Polib comctl32.dll /out:comctl32.lib
:: Polib comdlg32.dll /out:comdlg32.lib
:: Polib gdi32.dll /out:gdi32.lib
:: Polib kernel32.dll /out:kernel32.lib
:: Polib mpr.dll /out:mpr.lib
:: Polib shell32.dll /out:shell32.lib
:: Polib user32.dll /out:user32.lib
:: ml /EHsc /utf-8 main1.cpp /link /out:main1-x86.exe
:: /coff
:: ml /c /Zd shympler.asm /link /out:shympler.masm.exe
:: ml /c /Zd /omf mystub.asm
:: link16.exe /knoweas mystub.obj /out mystub.bin
ml /c /coff /Cp /Zd shympler.asm
Link /MACHINE:X86 /SUBSYSTEM:WINDOWS /entry:start /nodefaultlib /LIBPATH:libs /STUB:mystub.bin /MANIFESTFILE:xpmanifest.xml /out:shympler.masm.exe shympler.obj rex.lib libcmt.lib user32.lib kernel32.lib comctl32.lib comdlg32.lib shell32.lib gdi32.lib res\shympler.m.res
:: ml /c /Zd /coff shympler.asm /link /SUBSYSTEM:WINDOWS /entry:start /LIBPATH:libs /STUB:mystub.bin /MANIFESTFILE:xpmanifest.xml /ASSEMBLYRESOURCE:res\shympler.m.res /out:shympler.masm.exe

:: tasm32 /x /m /ml /l /D_TASM_ shympler.asm
:: tlink32 /Tpe /aa /c shympler.obj,,,,stub.def,res\shympler.m.res
:: del shympler.masm.exe
:: ren shympler.EXE shympler.masm.exe
