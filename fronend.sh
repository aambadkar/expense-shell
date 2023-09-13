source common.sh
component=frontend

echo installing nginx
dnf install nginx -y &>>$log_file
stat_check


echo placing expense config file in nginx
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file
stat_check

echo removing old nginx content
rm -rf /usr/share/nginx/html/* &>>$log_file
stat_check

cd /usr/share/nginx/html

download_and_extrac

echo starting nginx service
systemctl enable nginx &>>$log_file
systemctl restart nginx &>>$log_file
stat_check

