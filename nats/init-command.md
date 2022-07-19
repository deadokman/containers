export NSC_HOME=$(pwd)/nsc/accounts
export NKEYS_PATH=$(pwd)/nsc/nkeys

nsc add operator teta
nsc edit operator --service-url nats://localhost:4222
nsc edit operator --account-jwt-server-url http://localhost:9090/jwt/v1/

nsc add account sys
nsc.exe add user sys

nsc add account opz
nsc add user opz_sub --allow-sub "opz.>"
nsc add user opz_pub --allow-pub "opz.>"

nsc add account buroptima
nsc add user buroptima_pub --allow-pub "buroptima.>"
nsc add user buroptima_sub --allow-pub "buroptima.>"

nsc.exe push -A
