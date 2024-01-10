for /l %%i in (1, 1, 10) do (
@echo on    
python CodeMaker.py
python .py\Setup.py
)
