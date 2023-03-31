@echo off
set xv_path=D:\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto df624a436f3f4fec89da789c02f9f3ac -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot FPU_tb_behav xil_defaultlib.FPU_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
