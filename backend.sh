source  common.sh
component=backend

echo install nodJS Repos
curl -sL https://rpm.nodesource.com/setup_lts.x | bash >>$log_file
stat_check

echo copy backend service file
cp backend.service /etc/systemd/system/backend.service &>>$log_file
stat_check

echo install nodeJS
dnf install nodejs -y &>>$log_file
stat_check

echo add application user
id expense &>>log_file
if [ $? -ne 0 ]; then
  useradd expense &>>log_file
fi
stat_check

echo clean app contend
rm -rf /app &>>$log_file
stat_check

mkdir /app
cd /app

download_and_extract

echo download dependencies
npm install &>>$log_file
stat_check

echo start backend service
systemctl daemon-reload &>>$log_file
systemctl enable backend &>>$log_file
systemctl restart backend &>>$log_file
stat_check

echo install mysql client
dnf install mysql -y &>>$log_file
stat_check

echo load the schema
mysql -h mysql.devopsa17.online -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file
stat_check