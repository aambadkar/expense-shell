echo installing nginx
dnf install nginx -y >>/tmp/expense.log

echo placing expense config file in nginx
cp expense.conf /etc/nginx/default.d/expense.conf >>/tmp/expense.log

systemctl enable nginx
systemctl start nginx

echo removing old nginx content
rm -rf /usr/share/nginx/html/* >>/tmp/expense.log

echo download frontend code
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >>/tmp/expense.log

cd /usr/share/nginx/html >>/tmp/expense.log

echo extracting frontend code
unzip /tmp/frontend.zip >>/tmp/expense.log

echo starting nginx service
systemctl restart nginx >>/tmp/expense.log

