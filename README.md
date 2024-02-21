# CNC_pulse_gen
Module nội suy cho máy CNC, robot

Yêu cầu bài toán

Viết module nội suy cho máy CNC, robot bằng Verilog

• Đầu vào clk (1us), WR, LS

• Đầu vào N[7:0], Nx[7:0]

• Đầu ra Pulse, Dir

• Khi có xung cạnh lên của WR, Nx sẽ nạp giá trị mới.

• Khi LS = 1, ngõ ra Pulse = 0; Khi LS = 0, Pulse xuất ra theo nội suy.

• Nx[7] qui định bit dấu cho Dir, Nx[7] = 1, Dir = 1. Nx [7] = 0, Dir = 0. Nx[6:0] là giá trị số xung cần xuất

Sử dụng thuật toán nội suy đường thẳng theo phương pháp xung chuẩn
![image](https://github.com/CvNhien/CNC_pulse_gen/assets/111190445/ae0685e2-2ba8-4ad4-8518-8447b5465188)

**Các yêu cầu:**

1. Khi có xung cạnh lên của WR, Nx nạp giá trị mới. Nhưng giá trị này không tác  động ở chu kỳ T hiện tại, mà tác động ở chu kỳ T kế tiếp.
2. Khi không ghi giá trị Nx (không xuất xung WR và Nbuff = 0) ở chu kỳ T hiện tại, chu kỳ T kế tiếp không được xuất xung ra chân Pulse. (Không được lấy giá trị cũ để rải  tiếp)
3. Khi mô phỏng, add thêm 1 ngõ ra flag_T để kiểm tra hết mỗi chu kỳ T.
4. Mô phỏng N = 10, Cố định (k đổi N)
5. clk = 1us, clk1 = 100us,
6. Cho phép ghi tối đa 4 xung WR vào buffer trong 1 chu kỳ flag_T (Nbuff = 4), không lưu buffer nếu xung WR thứ 5 xảy ra. Khi ghi đủ 4 giá trị cờ flag_full = 1. Kiểm tra chỉ khi flag_full = 0 (khi Nbuff = 3, 2, 1, 0) thì mới tiếp tục nhận giá trị WR.
7. Khi LS = 1, ngõ ra Pulse = 0 và tất cả buffer sẽ bị xóa, xem như trạng thái reset lại từ đầu. Pulse chỉ xuất ở chu kỳ T kế tiếp khi LS = 0 và có xung WR sau đó.

**Kết quả mô phỏng trên phần mềm Quartus II**

![image](https://github.com/CvNhien/CNC_pulse_gen/assets/111190445/7450654e-9264-45c2-82c6-29d3300bd38c)


