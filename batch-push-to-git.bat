@ECHO OFF

REM �ɷ��õ�����ԣ���������д���޷�ִ��
REM Win10 -> ����ԣ�gpedit.msc�� -> ��������� -> Windows ���� -> �ű�������/�ػ��� �����ã��û�������Ҳ�в���ѡ��

REM ���ñ����ӳٱ���
SETLOCAL ENABLEDELAYEDEXPANSION

REM LFת����CRLF
git config --global core.autocrlf true

REM �ر�SSL���
SET GIT_SSL_NO_VERIFY=true



REM �ļ�������
SET /A counter=0
SET dir_path[%counter%]=��Ŀ·��1
SET dir_name[%counter%]=��Ŀ����1

SET /A counter=%counter%+1
SET dir_path[%counter%]=��Ŀ·��2
SET dir_name[%counter%]=��Ŀ����2



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
    git checkout "��֧��"
    git pull
    git status
    git add .
    git commit --no-verify -m "�����ύ %DATE% %TIME%"
    git push

    IF %%i LSS %counter% (
        ECHO.
        ECHO.
        ECHO.
    )
)

PAUSE