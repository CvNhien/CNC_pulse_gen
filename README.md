# CNC_pulse_gen
Module nội suy cho máy CNC, robot

Yêu cầu bài toán

Viết module nội suy cho máy CNC, robot bằng Verilog

• Đầu vào clk (1us), WR, LS

• Đầu vào N[7:0], Nx[7:0]

• Đầu ra Pulse, Dir
• Khi có xung cạnh lên của WR, Nx sẽ nạp giá trị mới.
• Khi LS = 1, ngõ ra Pulse = 0,
LS = 0, Pulse xuất ra theo nội suy.
• Nx[7] qui định bit dấu cho Dir,
Nx[7] = 1, Dir = 1.
Nx [7] = 0, Dir = 0.
Nx[6:0] là giá trị số xung cần xuất
Sử dụng thuật toán nội suy đường thẳng theo phương pháp xung chuẩn


