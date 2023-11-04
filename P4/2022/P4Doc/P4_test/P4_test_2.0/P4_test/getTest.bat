@echo on
:loop
python3.9 generate.py
python3.9 setup.py
call getCompile.bat
python3.9 comp.py
fc out.txt std.txt
pause
goto loop