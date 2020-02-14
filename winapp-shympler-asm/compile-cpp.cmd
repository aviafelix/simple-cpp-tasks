:: compile
:: : WorkDir:
:: "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\"
:: 32-bit:
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvars32.bat"
cl /EHsc /utf-8 shympler.cpp /link /LIBPATH:libs shympler.m.res /out:shympler1-x86.exe

:: 32-bit:
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvars32.bat"
cl /EHsc /source-charset:utf-8 /DEBUG /Zi /Od shympler.cpp /link /LIBPATH:libs shympler.m.res /out:shympler2-x86.dbg.exe
cl /EHsc /source-charset:utf-8 shympler.cpp /link /LIBPATH:libs shympler.m.res /out:shympler2-x86.exe
