log_file=/tmp/expense.log
echo installing nginx
dnf install nginx -y >>$log_file

echo placing expense config file in nginx
cp expense.conf /etc/nginx/default.d/expense.conf >>$log_file

systemctl enable nginx
systemctl start nginx

echo removing old nginx content
rm -rf /usr/share/nginx/html/* >>$log_file

echo download frontend code
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >>$log_file

cd /usr/share/nginx/html >>$log_file

echo extracting frontend code
unzip /tmp/frontend.zip >>$log_file

echo starting nginx service
systemctl restart nginx >>$log_file

