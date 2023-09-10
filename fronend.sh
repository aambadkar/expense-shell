echo installing nginx
dnf install nginx -y >/temp/expense.log

echo placing expense config file in nginx
cp expense.conf /etc/nginx/default.d/expense.conf >/temp/expense.log

systemctl enable nginx
systemctl start nginx

echo removing old nginx content
rm -rf /usr/share/nginx/html/* >/temp/expense.log

echo download frontend code
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >/temp/expense.log

cd /usr/share/nginx/html >/temp/expense.log

echo extracting frontend code
unzip /tmp/frontend.zip >/temp/expense.log

echo starting nginx service
systemctl restart nginx >/temp/expense.log

