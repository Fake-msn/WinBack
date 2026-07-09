@echo off
chcp 65001 >nul
echo ========================================
echo   WinBack 窗归 - 打包工具
echo ========================================
echo.

REM 检查 Python
python --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未找到 Python，请先安装 Python 3.8+
    pause
    exit /b 1
)

REM 检查 安装 pyinstaller
pip show pyinstaller >nul 2>&1
if errorlevel 1 (
    echo [信息] 正在安装 pyinstaller...
    pip install pyinstaller
)

echo [信息] 开始打包...
echo.

REM 打包为单个 exe 文件 (纯 Win32 API，无 tkinter 依赖)
pyinstaller --onefile --windowed --name "WinBack" ^
    --clean ^
    --noconfirm ^
    display_window_manager.py

echo.
echo ========================================
echo   打包完成！
echo   输出文件: dist\WinBack.exe
echo ========================================
pause