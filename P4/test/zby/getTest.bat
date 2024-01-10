@echo on
:loop
python generate.py
python setup.py
call compile.bat
python comp.py
fc out.txt std.txt
pause
goto loop