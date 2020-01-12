tasm32 /x /m /ml /l /D_TASM_ %1.a__
tlink32 /Tpe /aa /c %1.obj,,,,stub.def,%1.res