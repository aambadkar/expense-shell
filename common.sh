log_file=/tmp/expense.log

download_and_extract() {
 echo download $component code
  echo $?

 echo extracting $component code
 unzip /tmp/$component.zip >>$log_file
 echo $?
}

stat_check(){
  if [ $? -eq 0 ]; then
    echo -e "\e[32mSUCCESS\e[0m"
  else
    echo -e "\e[31mFAILED\e[0m"
    exit 1
  fi
}