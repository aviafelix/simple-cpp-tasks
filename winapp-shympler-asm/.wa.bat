wasm shympler.asm
rem wlink name nih-nih sys nt_win op m op nod op maxe=25 op q op symf FIL nihnih.obj op start='_WinMain@16' LIBPath D:\PROGRAMMING\WATCOM\lib386\nt lib comctl32.lib,clib3r.lib
wlink name shympler.wasm_w.exe sys nt_win op m op nod op maxe=25 op q op symf FIL shympler.obj op c LIBPath D:\PROGRAMMING\WATCOM\lib386\nt lib user32.lib,kernel32.lib,comdlg32.lib,rex.lib,shell32.lib,gdi32.lib op stub=mystub.bin res shympler.w.res
wlink name shympler.wasm_m.exe sys nt_win op m op nod op maxe=25 op q op symf FIL shympler.obj op c LIBPath D:\PROGRAMMING\WATCOM\lib386\nt lib user32.lib,kernel32.lib,comdlg32.lib,rex.lib,shell32.lib,gdi32.lib op stub=mystub.bin res shympler.m.res
