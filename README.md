#BÀI TẬP THỰC HÀNH LAB 2

## Họ và tên: Nguyễn Diên Sỹ Đạo.
## Mssv: 24410013
### I.	BÀI TẬP (2.6)
#### 1)	Tìm hiểu trên Google về việc cài đặt lệnh git, sử dụng git để tải thư mục ảnh tại đây: https://github.com/locth/OS_LAB2_IMG.git Viết một file kịch bản để làm những công việc sau:

##### a)	Kiểm tra trong thư mục người dùng, nếu thấy thư mục PNG và JPG chưa tồn tại thì tạo 02 thư mục này.

-	Source code:

  # Lấy đường dẫn đến thư mục hiện tại
      CURRENT_DIR=$(pwd)
  # Đường dẫn đến thư mục chứa hình ảnh và các thư mục đích
      IMG_DIR="$CURRENT_DIR/OS_LAB2_IMG" # Thư mục chứa hình ảnh
      PNG_DIR="$CURRENT_DIR/PNG" # Thư mục chứa file PNG
      JPG_DIR="$CURRENT_DIR/JPG" # Thư mục chứa file JPG
      DIRS=("$PNG_DIR" "$JPG_DIR") # Mảng chứa các thư mục đích ( PNG và JPG )

  # Duyệt qua mảng DIRS để kiểm tra và tạo thư mục nếu chưa tồn tại
      for DIR in "${DIRS[@]}"; do # Duyệt qua mảng DIRS.
        if [ ! -d "$DIR" ]; then # Nếu thư mục không tồn tại thì tạo mới và thông báo.
          mkdir "$DIR" # Tạo thư mục từ phần tử hiện tại của mảng DIRS.
          echo "Thư mục $DIR đã được tạo thành công" # Thông báo tạo mới thành công.
        else # Ngược lại nếu thư mục đã tồn tại thì thông báo thư mục đã tồn tại.
          echo "Thư mục $DIR đã tồn tại"
        fi
      done


-	Kết quả chạy script khi chưa tạo thư mục:

 

-	Kết quả chạy script lần thứ 2 sau khi đã tạo thư mục thành công:

 


b)	Di chuyển tất cả file PNG trong thư mục ảnh ở trên vào thư mục PNG. Xuất ra màn hình số lượng ảnh PNG.

-	Source code xử lý cho PNG:

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


c)	Di chuyển tất cả file JPG trong thư mục ảnh ở trên vào thư mục JPG. Xuất ra màn hình số lượng ảnh JPG.

-	Source code xử lý cho JPG:



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


-	Kết quả thực hiện được khi chạy source code cho cả PNG và JPG:

 

-	Đây là kết quả khi thực hiện lần đầu tiên lúc các hình ảnh ở thư mục chứa ảnh với đường dẫn được khai báo `IMG_DIR` ở trên.

-	Và lần thực hiện thứ 2 là sau khi đã di chuyển tất cả hình ảnh có đuôi tương ứng với png và jpg.

2). Tạo ra một file text tên ‘monhoc.txt’ chứa danh sách mã môn học của sinh viên trong học kỳ này, mỗi mã nằm trên một dòng. Viết một file kịch bản thực hiện các việc sau:

a)	Yêu cầu người dùng nhập vào họ và tên (không dấu), tạo ra thư mục có tên tương ứng với thông tin người dùng vừa nhập.

-	Source code:

  # Yêu cầu người dùng nhập vào họ và tên (không dấu)
    echo "Nhập vào họ và tên của bạn (không dấu):" # Thông báo yêu cầu nhập thông tin
    read USER_NAME # Đọc thông tin người dùng từ bàn phím

  # Tạo thư mục có tên tương ứng với thông tin người dùng vừa nhập
  # Dùng mkdir và option -p để tạo thư mục và tất cả các thư mục cha nếu chưa tồn tại
    mkdir -p "$USER_NAME" 
    echo "Đã tạo thư mục: $USER_NAME" # Thông báo đã tạo thư mục


b)	Đọc file text ‘monhoc.txt’ ở trên, ở trong thư mục vừa tạo ở câu a, với mỗi môn học, tạo ra một thư mục có tên tương ứng với mã môn đó.

-	Source code:

  while IFS= read -r MON_HOC; do # Đọc từng dòng trong file monhoc.txt và gán vào biến MON_HOC
    if [ ! -z "$MON_HOC" ]; then # Kiểm tra nếu dòng không rỗng thì tạo thư mục con
    # Tạo thư mục con từ dòng hiện tại trong file monhoc.txt
      mkdir -p "$USER_NAME/$MON_HOC" 
    # Thông báo đã tạo thư mục con
      echo "Đã tạo thư mục môn học: $USER_NAME/$MON_HOC" 
    fi
  done < monhoc.txt  # `< monhoc.txt` Lấy đầu vào từ file monhoc.txt cho while


-	Kết quả thực hiện được:

 

Ghi chú: 
•	1: Các thư mục con có tên tương ứng được tạo mới từ các dòng lấy từ file ` monhoc.txt `.
•	2: Nội dung file ` monhoc.txt`.
•	3: Kết quả sau khi thực hiện.


File bài tập: 
-	Bài tập 1:  
-	Bài tập 2:  

-	Nội dung file ‘monhoc.txt’:
HE_DIEU_HANH
QUAN_LY_THONG_TIN
CO_SO_HA_TANG
GT_NGANH_CNTT
DAI_SO_TUYEN_TINH

![image](https://github.com/user-attachments/assets/175a0c4e-42a8-4857-a94f-70ad19919a38)
