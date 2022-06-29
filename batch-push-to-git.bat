@ECHO OFF

REM 可放置到组策略，但组策略有错就无法执行
REM Win10 -> 组策略（gpedit.msc） -> 计算机配置 -> Windows 设置 -> 脚本（启动/关机） 下设置，用户配置下也有部分选项

REM 设置本地延迟变量
SETLOCAL ENABLEDELAYEDEXPANSION

REM LF转换成CRLF
git config --global core.autocrlf true

REM 关闭SSL检查
SET GIT_SSL_NO_VERIFY=true



REM 文件夹数组
SET /A counter=0
SET dir_path[%counter%]=项目路径1
SET dir_name[%counter%]=项目名称1

SET /A counter=%counter%+1
SET dir_path[%counter%]=项目路径2
SET dir_name[%counter%]=项目名称2



FOR /L %%i IN (0,1,%counter%) DO (
    ECHO ================================================
    ECHO.
    ECHO   !dir_name[%%i]!
    ECHO   !dir_path[%%i]!
    ECHO.
    ECHO ================================================
    ECHO.

    CD /D "!dir_path[%%i]!"
    git gc --auto
    git checkout "分支名"
    git pull
    git status
    git add .
    git commit --no-verify -m "批量提交 %DATE% %TIME%"
    git push

    IF %%i LSS %counter% (
        ECHO.
        ECHO.
        ECHO.
    )
)

PAUSE