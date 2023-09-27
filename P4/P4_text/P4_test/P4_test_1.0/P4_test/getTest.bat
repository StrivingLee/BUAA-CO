@echo on
python3.9 setup.py
call getCompile.bat
python3.9 comp.py
fc out.txt std.txt
pause