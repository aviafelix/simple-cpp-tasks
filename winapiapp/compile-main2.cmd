:: compile
:: : WorkDir:
:: "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\"
:: 32-bit:
:: %comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvars32.bat"
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvars32.bat"
cl /EHsc /DEBUG /Zi /Od main2.cpp /link /out:main2-x86.dbg.exe
cl /EHsc main2.cpp /link /out:main2-x86.exe
:: 64-bit:
:: %comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
cl /EHsc /DEBUG /Zi /Od main2.cpp /link /out:main2-x64.dbg.exe
cl /EHsc main2.cpp /link /out:main2-x64.exe
