--Câu 1: tạo CSDL QLNhanVien
create database QLNhanVien
use QLNhanVien

-- Câu 2a
drop table NHANVIEN
create table NHANVIEN
(
	MaNV nvarchar(8),
	HoTen nvarchar(30),
	Congviec nvarchar (50),
	Luong int,
	MaDV char(4),
	MaPT char(8),
	primary key (MaNV),
)

-- Câu 2b
drop table DONVI
create table DONVI
(
	MaDV nvarchar(4),
	TenDV nvarchar (50),
	primary key (MaDV),
)

-- Câu 2c
drop table BACLUONG
create table BACLUONG
(
	MaBac nvarchar(50),
	BacThap int,
	BacCao int,
	primary key (MaBac),
)

-- Câu 3: Thêm dữ liệu cho bảng NHANVIEN
insert into NHANVIEN (MaNV, HoTen, Congviec, Luong, MaDV)
values (N'NV001', N'Phạm Thị Nhàn', N'Thư ký', 500, '0001'), 
		(N'NV002', N'Hoàng Thanh Vân', N'Giáo viên', 600, '0001'),
		(N'NV003', N'Hoàng Thị Lan', N'Giáo viên', 200, '0002'),
		(N'NV004', N'Đỗ Trung Dũng', N'Thư ký', 700, '0003')

-- Câu 4: Thêm dữ liệu cho bảng DONVI
insert into DONVI (MaDV, TenDV)
values (N'0001', N'KHTN'), (N'0002', N'DHTL'), (N'0003', N'DHQG')


-- Câu 5: Thêm dữ liệu cho bảng BACLUONG
insert into BACLUONG (MaBac, BacThap, BacCao)
values ( '1', 400, 500), ('2', 501, 600), ('3', 601, 800)


-- Câu 6: Dùng câu lệnh truy vấn dữ liệu, đưa ra tất cả thông tin nhân viên
select MaNV, HoTen, Congviec, Luong, MaDV from NHANVIEN

-- Câu 7: Đưa ra Hoten, Congviec, Luong của tất cả các nvien
select HoTen, Congviec, Luong from NHANVIEN

-- Câu 8: Đưa ra toàn bộ công vc của NV, các gtri k trùng nhau
select Distinct Congviec from  NHANVIEN

-- Câu 9: Đưa ra Hoten, LuongQuy của tất cả các NV, với LuongQuy = Luong*3
select HoTen, Luong*3 AS LuongQuy from NHANVIEN

-- Câu 10: Đưa ra Hoten, Luong sắp xếp theo thứ tự tăng dần/giảm dần của Luong
 select HoTen, Luong from NHANVIEN order by Luong ASC 
 select HoTen, Luong from NHANVIEN order by Luong DESC

-- Câu 11: Đưa ra Hoten, Luong cua cac NV có Luong > 300
 select HoTen, Luong from NHANVIEN where Luong > 300

-- Câu 12: Đưa ra Hoten, Luong của các nhân viên có Luong > 300 và làm Congviec là Giáo viên
 select HoTen, Luong from NHANVIEN where Luong > 300 and Congviec = 'Giáo viên'

-- Câu 13: Đưa ra những nhân viên có lương hoặc 200, 300, 600
 select * from NHANVIEN where Luong = 200 or Luong = 300 or Luong = 600
 
-- Câu 14: Đưa ra những nhân viên có lương trong khoảng 300 đến 600
 select * from NHANVIEN where Luong between 300 and 600

-- Câu 15: Đưa ra Hoten, Congviec của các nhân viên có họ tên bắt đầu bằng chữ 'Hoàng'
 select HoTen, Congviec from NHANVIEN where HoTen like 'Hoàng%'

-- Câu 16: Đưa ra lương trung bình, lương lớn nhất, nhỏ nhất của tất cả các nvien trong bảng NHANVIEN
 -- lương trung bình: 
 select AVG(Luong) AS LuongTB from NHANVIEN 
 -- lương lớn nhất:
 select MAX(Luong) AS Luong_lon_nhat from NHANVIEN
 -- lương nhỏ nhất:
 select MIN(Luong) AS Luong_nho_nhat from NHANVIEN

 -- Câu 17: Đưa ra Công việc, lương trung bình của từng loại công việc
 select Congviec, AVG(Luong) AS LuongTB from NHANVIEN group by Congviec

 -- Câu 18: Đưa ra Công việc, lương trung bình của tất cả các nhân viên có Luong > 200 theo từng loại Congviec
  select Congviec, AVG(Luong) AS LuongTB from NHANVIEN where Luong > 200 group by Congviec

-- Câu 19: Đưa ra tổng lương của từng nhóm công việc trong từng đơn vị
select MaDV, Congviec, sum(Luong) AS Tong_luong from NHANVIEN group by Congviec, MaDV

-- Câu 20: Đưa ra những công việc và trung bình lương của các công việc có trung bình lương >= 300
select Congviec, AVG(Luong) AS LuongTB from NHANVIEN group by Congviec having AVG (Luong) >= 300

-- Câu 21: Đưa ra những đơn vị và lương lớn nhất của các đơn vị có lương lớn nhất >=300
select MaDV, MAX(Luong) AS Luong_lon_nhat from NHANVIEN
group by MaDV having MAX (Luong) >= 300

-- Câu 22: Đưa ra Hoten, Congviec, TenDV của tất cả nhân viên
select Hoten, CongViec,TenDV From NHANVIEN, DONVI Where NHANVIEN.MaDV = DONVI.MaDV

-- Câu 23: Câu lệnh dưới đây cho ra kqua:
select HoTen, Congviec, TenDV from NHANVIEN NV, DONVI DV Where NV.MaDV = DV.MaDV

-- Câu 24: Đưa ra HoTen, Congviec, TenDV, Luong của những nhân viên có Luong >= 500
select HoTen, Congviec, TenDV, Luong from NHANVIEN, DONVI 
where Luong >= 500 and NHANVIEN.MaDV = DONVI.MaDV

-- Câu 25: Câu lệnh dưới đây cho ra kqua:
select NV.MaNV, NV.HoTen, PT.MaNV, PT.HoTen from NHANVIEN NV, NHANVIEN PT where (NV.MaNV = PT.MaPT) and (NV.Luong > PT.Luong)

-- Câu 27: Đưa ra những công việc trong đơn vị 1 có MaDV là 0001 và đơn vị 2 có MaDV là 0002
(select  Congviec from NHANVIEN where MaDV = '0001') union
(select  Congviec from NHANVIEN where MaDV = '0002')
select * from NHANVIEN

---> chữa
select distinct Congviec from NHANVIEN where MaDV = '0001' or MaDV = '0002' 
group by Congviec
-- Câu 28: Đưa ra HoTEn, TenDV, Congviec, Luong của những người có lương lớn hơn lương trung bình của toàn bộ nhân viên
select HoTen, TenDV, Congviec, Luong from NHANVIEN, DONVI
where Luong > (select AVG(Luong) as LuongTB from NHANVIEN) and NHANVIEN.MaDV = DONVI.MaDV

-- Câu 29: Đưa ra những nhân viên có lương lớn hơn người có lương lớn nhất trong đơn vị có tên là DHTL
select * from NHANVIEN, DONVI 
where NHANVIEN.MaDV = DONVI.MaDV and 
Luong > (select MAX(Luong) as Luong_lon_nhat from NHANVIEN where MaDV = (select MaDV from DONVI where TenDV = 'DHTL')) 

---> Cách 2
select * from NHANVIEN
where (Luong > (select max(NHANVIEN.Luong)
                  from NHANVIEN, DONVI
				  where NHANVIEN.MaDV = DONVI.MaDV and DONVI.TenDV like 'DHTL'),

-- Câu 30: Đưa ra HoTen, MaDV, Luong của các nhân viên có Luong = Luong thấp nhất trong đơn vị của họ
select HoTen, MaDV, Luong from NHANVIEN
where (Luong) in (select MIN(Luong) as luong_thap_nhat from NHANVIEN)

-- chữa
select HoTen, MaDV, Luong
-- Câu 31: Đưa ra HoTen, MaDV, Luong của các nhân viên có Lương = Lương thấp nhất trong một đơn vị nào đó
select HoTen, MaDV, Luong from NHANVIEN
where Luong in (select MIN(Luong) as luong_thap_nhat from NHANVIEN)

--Câu 32: Đưa ra HoTen, Luong của các nhân viên có Lương lớn nhất của đơn vị có mã đơn vị là 0002
select HoTen, Luong from NHANVIEN where Luong = (select MAX(Luong) as Luong_lon_nhat from NHANVIEN where MaDV like '0002')

--Câu 33: Đưa ra MaDV, AVG(Luong) của đơn vị có trung bình lương lớn hơn lương nhỏ nhất của đơn vị có mã đơn vị là 0003
select Min(Luong) From NHANVIEN where MaDv = '0003'
select MaDV, AVG(Luong) As LuongTB
from NHANVIEN 
group by MaDV
having AVG(Luong) > (select Min(Luong) From NHANVIEN where MaDv = '0003') ;

