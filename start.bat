@echo off

REM Check if the number is 14, 16, or 26
IF NOT "%1"=="14" (
    IF NOT "%1"=="16" (
        IF NOT "%1"=="26" (
            echo This is a DEMO version invalid day. Allowed days are 14, 16, or 26. Buy the full course.
            exit /b 1
        )
    )
)

echo [+] Stoping and removing old lab containers "cqvulnsite-demo_*"
docker-compose --profile "day%1" down
for /F "tokens=*" %%i in ('docker ps -q --filter "name=cqvulnsite-main-"') do docker stop %%i
for /F "tokens=*" %%i in ('docker ps -a -q --filter "name=cqvulnsite-main-"') do docker rm %%i

docker-compose --profile "day%1" pull
echo [+] Starting lab for lesson %1...
set DAY=%1
docker-compose --profile "day%1" up
