#!/bin/bash

  # Lấy đường dẫn đến thư mục hiện tại
      CURRENT_DIR=$(pwd)
  # Đường dẫn đến thư mục chứa hình ảnh và các thư mục đích
      IMG_DIR="$CURRENT_DIR/OS_LAB2_IMG" # Thư mục chứa hình ảnh
      PNG_DIR="$CURRENT_DIR/PNG" # Thư mục chứa file PNG
      JPG_DIR="$CURRENT_DIR/JPG" # Thư mục chứa file JPG
      DIRS=("$PNG_DIR" "$JPG_DIR") # Mảng chứa các thư mục đích ( PNG và JPG )

  # Duyệt qua mảng [DIRS] để kiểm tra và tạo thư mục nếu chưa tồn tại
      for DIR in "${DIRS[@]}"; do # Duyệt qua mảng DIRS
        if [ ! -d "$DIR" ]; then # Kiểm tra nếu thư mục không tồn tại thì tạo mới và thông báo tạo mới thành công
          mkdir "$DIR" # Tạo thư mục từ phần tử hiện tại của mảng DIRS
          echo "Thư mục $DIR đã được tạo thành công" # Thông báo tạo mới thành công
        else # Ngược lại nếu thư mục đã tồn tại thì thông báo thư mục đã tồn tại
          echo "Thư mục $DIR đã tồn tại"
        fi
      done

  # Di chuyển tất cả file PNG từ thư mục OS_LAB2_IMG vào thư mục PNG và đếm số lượng
    PNG_COUNT=$(find "$IMG_DIR" -maxdepth 1 -type f -iname '*.png' | wc -l)
    # Tìm tất cả file PNG trong thư mục OS_LAB2_IMG và đếm số lượng
      # Nếu số lượng file PNG > 0 thì
      if [ $PNG_COUNT -gt 0 ]; then 
        mv "$IMG_DIR"/*.png "$PNG_DIR" # Dùng lệnh mv để di chuyển.
        echo "Đã chuyển $PNG_COUNT file PNG vào $PNG_DIR" # Thông báo số lượng.
      else
      # Ngược lại nếu không có file PNG nào thì thông báo.
        echo "Không có file PNG nào để di chuyển"
      fi

  # Di chuyển tất cả file JPG từ thư mục OS_LAB2_IMG vào thư mục PNG và đếm số lượng
    JPG_COUNT=$(find "$IMG_DIR" -maxdepth 1 -type f -iname '*.jpg' | wc -l)
    # Tìm tất cả file JPG trong thư mục OS_LAB2_IMG và đếm số lượng
      # Nếu số lượng file JPG > 0 thì
      if [ $JPG_COUNT -gt 0 ]; then
        mv "$IMG_DIR"/*.jpg "$JPG_DIR" # Dùng lệnh mv để di chuyển.
        echo "Đã chuyển $JPG_COUNT file JPG vào $JPG_DIR" # Thông báo số lượng.
      else
      # Ngược lại nếu không có file JPG nào thì thông báo.
        echo "Không có file JPG nào để di chuyển"
      fi




