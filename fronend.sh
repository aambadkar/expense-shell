source common.sh
component=frontend

echo installing nginx
dnf install nginx -y >>$log_file

echo placing expense config file in nginx
cp expense.conf /etc/nginx/default.d/expense.conf >>$log_file

systemctl enable nginx >>$log_file
systemctl start nginx

echo removing old nginx content
rm -rf /usr/share/nginx/html/* >>$log_file
cd /usr/share/nginx/html

download_and_extract

echo starting nginx service
systemctl restart nginx >>$log_file

