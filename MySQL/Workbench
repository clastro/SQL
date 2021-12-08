# WORKBENCH에서 DDL이 안 되는 오류 해결

SHOW FULL processlist;

# 오류 원인에 대해서 kill 명령어로 processlist 삭제

EX) kill 2048; #2048은 ID

SELECT * FROM information_schema.INNODB_TRX;

트랜젝션을 깨끗하게 비우면 해결
