#!/bin/bash

  # Yêu cầu người dùng nhập vào họ và tên (không dấu)
    echo "Nhập vào họ và tên của bạn (không dấu):" # Thông báo yêu cầu nhập thông tin
    read USER_NAME # Đọc thông tin người dùng từ bàn phím

  # Tạo thư mục có tên tương ứng với thông tin người dùng vừa nhập
  # Dùng mkdir và option -p để tạo thư mục và tất cả các thư mục cha nếu chưa tồn tại
    mkdir -p "$USER_NAME" 
    echo "Đã tạo thư mục: $USER_NAME" # Thông báo đã tạo thư mục



  
  while IFS= read -r MON_HOC; do # Đọc từng dòng trong file monhoc.txt và gán vào biến MON_HOC
    if [ ! -z "$MON_HOC" ]; then # Kiểm tra nếu dòng không rỗng thì tạo thư mục con
    # Tạo thư mục con từ dòng hiện tại trong file monhoc.txt
      mkdir -p "$USER_NAME/$MON_HOC" 
    # Thông báo đã tạo thư mục con
      echo "Đã tạo thư mục môn học: $USER_NAME/$MON_HOC" 
    fi
  done < monhoc.txt  # `< monhoc.txt` Lấy đầu vào từ file monhoc.txt cho while
  

