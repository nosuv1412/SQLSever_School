create database MT
use MT

create table CUAHANG
(
	MaCH char (5) not null primary key,
	TenCH nvarchar (50),
	Diachi nvarchar (50),
	SĐT nvarchar (15),
)
create table NHANVIEN
(
	MaNV char (8) not null Primary key,
	TenNV nvarchar(50),
	Diachi nvarchar (50),
	Ngaysinh date,
	Luong int,
	Gioitinh nvarchar (4),
	MaCH char (5),
	MaNQL char (8),
	foreign key (MaCH) references CUAHANG (MaCH),
)

create table HOADONNHAP
(
	MaHDnhap char (6) not null primary key,
	Ngaynhap date,
	SoluongN int,
	TongtienN int,
	MaNV char(8),
	foreign key (MaNV) references NHANVIEN (MaNV),
)

create table NHACUNGCAP
(
	MaCC char (7) not null primary key,
	DiachiCC nvarchar(50),
	SĐT_CC nvarchar(15),
	TenCC nvarchar(50),
)

create table KHACHHANG
(
	SĐT_Kh nvarchar(15) not null primary key,
	Tenkhach nvarchar(50),
	Ngaymua date,
)

create table HOADONXUAT
(
	MaHDxuat char (6) not null primary key,
	Ngayxuat date,
	SoluongX int,
	TongtienX int,
	MaNV char(8),
	SĐT_Kh nvarchar(15),
	foreign key (MaNV) references NHANVIEN (MaNV),
	foreign key (SĐT_Kh) references KHACHHANG (SĐT_Kh),
)

create table HANG 
(
	MaH char(7) not null primary key,
	TenH nvarchar(50),
	SoluongH int,
	Dongia int,
	SĐT_Kh nvarchar(15),
	MaHDnhap char (6),
	MaHDxuat char (6),
	foreign key (MaHDnhap) references HOADONNHAP (MaHDnhap),
	foreign key (MaHDxuat) references HOADONXUAT (MaHDxuat),
	foreign key (SĐT_Kh) references KHACHHANG (SĐT_Kh),
)

create table CUNGCAP
(
	MaH char(7),
	MaCC char (7),
	foreign key (MaH) references HANG (MaH),
	foreign key (MaCC) references NHACUNGCAP (MaCC),
)

create table PHUCVU
(
	MaNV char (8),
	SĐT_Kh nvarchar(15),
	foreign key (MaNV) references NHANVIEN (MaNV),
	foreign key (SĐT_Kh) references KHACHHANG (SĐT_Kh),
)

insert into CUAHANG (MaCH, TenCH, Diachi, SĐT)
values ('01',N'PTH Store',N'100 Tây Sơn','0868866886'),
       ('02',N'PTH Store 2',N'47 Thái Hà','0868866888')

insert into NHANVIEN (MaNV, TenNV, Diachi, Ngaysinh, Luong, Gioitinh, MaCH, MaNQL)
values ('NV1', N'Nguyễn Văn An',    N'Bùi Xương Trạch', '2/11/2000', 6000, N'Nam','01','QL01'),
       ('NV2', N'Trần Văn Hải',     N'Hồ Tây',          '5/11/2002',5000, N'Nam','01', ' '),
	   ('NV3', N'Nguyễn Văn Minh',  N'Quốc Oai',        '5/6/1998', 4000, N'Nam','01', ' '),
	   ('NV4', N'Hoàng Thùy Trang', N'Tây Sơn',         '7/8/1999', 6000, N'Nữ','02',' '),
	   ('NV5', N'Trịnh Ngọc Tú',    N'Trần Duy Hưng',   '8/5/2000', 5000, N'Nam','02',' '),
	   ('NV6', N'Trần Hoàng Tài',   N'41 Thái Hà',      '8/12/2002', 4000, N'Nam','02',' '),
	   ('NV7', N'Nguyễn Minh Ngọc', N'Hà Nội',          '9/25/2000', 3000, N'Nữ', '02', 'QL02')

insert into HOADONNHAP (MaHDnhap, Ngaynhap, SoluongN, TongtienN, MaNV)
values ('N1', '5/20/2021', 100, 500000, 'NV1'),
       ('N2', '6/21/2021', 100, 450000, 'NV3'),
	   ('N3', '5/22/2021', 100, 550000, 'NV2'),
	   ('N4', '12/19/2020', 100, 570000, 'NV4'),
	   ('N5', '10/23/2021', 100, 650000, 'NV5'),
	   ('N6', '5/24/2021', 100, 350000, 'NV6'),
	   ('N7', '9/28/2020', 50, 250000, 'NV7'),
	   ('N8', '2/15/2020', 300, 9000000, 'NV2'),
	   ('N9', '11/1/2021', 50, 250000, 'NV4'),
	   ('N10', '7/8/2020', 150, 1500000, 'NV2')
select * from HOADONNHAP

insert into NHACUNGCAP (MaCC, DiachiCC,SĐT_CC, TenCC)
values ('S1', N'Vĩnh Phúc', '0543345678', N'Hoco GAMING'),
       ('S2', N'Hải Phòng', '0123456789', N'ASUS GAMING'),
	   ('S3', N'Quảng Ninh', '0478654178', N'HP GAMING'),
	   ('S4', N'Hà Nội', '0874569812', N'DELL GAMING'),
	   ('S5', N'Hà Nội', '0987456321', N'ACER GAMING'),
	   ('S6', N'Hà Nội', '0898715478', N'LENNOVO GAMING'),
	   ('S7', N'Hà Nội', '0587146879', N'APPLE GAMING')
select * from NHACUNGCAP

insert into KHACHHANG (SĐT_Kh, Tenkhach, Ngaymua)
values ('0123456789', N'Bùi Hoàng Gia',    '9/28/2020'),
       ('0987654321', N'Trần Duy Quang',   '6/29/2021'),
	   ('0847843647', N'Lê Tú Anh',        '6/30/2021'),
	   ('0862455658', N'Trần Thanh Thảo',  '9/28/2020'),
	   ('0379462223', N'Nguyễn Minh Phúc', '9/28/2020'),
	   ('0956783215', N'Tô Hương Quỳnh',   '7/5/2021'),
	   ('0358267102', N'Nguyễn Thị Diệp',  '7/20/2021')
select * from KHACHHANG

insert into HOADONXUAT (MaHDxuat, Ngayxuat, SoluongX, TongtienX, MaNV, SĐT_Kh)
values ('X01','9/28/2020', 2, 200000, 'NV1', '0123456789'),
       ('X02', '6/29/2021', 1, 150000, 'NV5', '0987654321'),
	   ('X03', '6/30/2021', 2, 200000, 'NV6', '0847843647'),
	   ('X04', '7/5/2021', 3, 300000, 'NV2', '0956783215'),
	   ('X05', '7/20/2021', 1, 250000, 'NV5', '0358267102'),
	   ('X06', '9/28/2020', 4, 360000, 'NV2', '0379462223'),
	   ('X07', '9/28/2020', 3, 350000, 'NV1', '0862455658'),
	   ('X08', '6/20/2021', 1, 60000, 'NV2', '0379462223'),
	   ('X09', '11/1/2020', 3, 900000, 'NV2', '0862455658')
select * from HOADONXUAT

insert into HANG (MaH, TenH, SoluongH, Dongia, SĐT_Kh, MaHDnhap, MaHDxuat)
values ('H1', N'MSI G573 GAMING', 2, 100000, '0123456789', 'N1', 'X01'),
       ('H2', N'DELL D30 GAMING', 1, 150000, '0987654321', 'N2', 'X02'),
	   ('H3', N'HP HH5 GAMING',	  2, 100000, '0847843647', 'N3', 'X03'),
	   ('H4', N'Chuột dareu',     3, 100000, '0956783215', 'N4', 'X04'),
	   ('H5', N'Tai nghe hoco',   1, 250000, '0358267102', 'N5', 'X05'),
	   ('H6', N'Ổ cứng HDD',      4, 90000,  '0379462223', 'N6', 'X06'),
	   ('H7', N'Dell vostro',     3, 350000, '0862455658', 'N7', 'X07'),
	   ('H8', N'Chuột XP',        1, 60000,  '0379462223', 'N8', 'X08'),
	   ('H9', N'Chuột dareu',     3, 900000, '0862455658', 'N4', 'X09')
select * from HANG

insert into PHUCVU(MaNV, SĐT_Kh)
values ('NV1','0123456789'),
	   ('NV2','0956783215'),
	   ('NV3', null),
	   ('NV4', null),
	   ('NV5','0987654321'),
	   ('NV6', null)
select * from PHUCVU

insert into CUNGCAP(MaH,MaCC)
values ('H2', 'S1'),
		('H3', 'S1'),
		('H4', 'S1'),
		('H6', 'S7'),
       ('H1','S1'),
       (null,'S2'),
	   ('H3','S3'),
	   ('H4','S4'),
	   (null,'S5'),
	   (null,'S6'),
	   (null,'S7')
select * from CUNGCAP

-- Câu 1: liệt kê mã, tên của những nhân viên có địa chỉ ở Hà Nội
select MaNV, TenNV from NHANVIEN where Diachi like N'Hà Nội' 

-- Câu 2: Đưa ra thông tin những nhân viên có họ Nguyễn
select * from NHANVIEN where TenNV like N'Nguyễn%'

-- Câu 3: Đưa ra trung bình lương, lương lớn nhất và thấp nhất của nhân viên
select AVG(Luong) as TB_luong from NHANVIEN 
select MAX(Luong) as Luong_lon_nhat from NHANVIEN
select MIN(Luong) as Luong_thap_nhat from NHANVIEN

-- Câu 4: Đưa ra nhân viên có lương lớn nhất
select MaNV, TenNV, Luong as Luong_lon_nhat from NHANVIEN 
group by MaNV, TenNV, Luong having Luong >= (select Max(Luong) as luong_lon_nhat from NHANVIEN)

-- Câu 5: Đưa ra tên nv, tên cửa hàng làm việc của tất cả các nhân viên
select TenNV, TenCH from CUAHANG, NHANVIEN where CUAHANG.MaCH = NHANVIEN.MaCH

-- Câu 6: Đưa ra tên nhân viên đã xuất hàng ngày '28/9/2020'
select TenNV, MaHDxuat from NHANVIEN, HOADONXUAT where (NHANVIEN.MaNV = HOADONXUAT.MaNV) and 
(day(Ngayxuat) = 28) and (month(Ngayxuat) = 9) and (year(Ngayxuat) = 2020)

-- Câu 7: Cho biết thông tin các hàng đc bán trong tháng 7/2021
select * from HANG,HOADONXUAT where (HANG.MaHDxuat = HOADONXUAT.MaHDxuat) and 
(month(Ngayxuat) = 7) and (year(Ngayxuat) = 2021)

-- Câu 8: Đếm số hóa đơn nhập của từng nhân viên
select TenNV, count(MaHDnhap) as Solannhap from NHANVIEN, HOADONNHAP
where NHANVIEN.MaNV = HOADONNHAP.MaNV group by TenNV

-- Câu 9: Đưa ra số lần mua hàng của khách 
select Tenkhach, count(MaHDxuat) as Solanmua from KHACHHANG, HOADONXUAT
WHERE(KHACHHANG.SĐT_Kh = HOADONXUAT.SĐT_Kh) group by Tenkhach 

-- Câu 10: Đưa ra nhân viên có sinh nhật vào tháng 8 và có giới tính Nam
select MaNV, TenNV from NHANVIEN where (month(Ngaysinh) = 8) and (Gioitinh like N'Nam')


--Câu 11 Đưa ra mặt hàng bắt đầu bằng chữ M và kết thúc bằng chữ G
select MaH, TenH from HANG
where TenH like 'M%G'

--Câu 12 Đưa ra những khách hàng mua hàng ngày '28-09-2020'
select distinct Tenkhach from KHACHHANG, HOADONXUAT
where (KHACHHANG.SĐT_Kh = HOADONXUAT.SĐT_Kh) and 
(day(Ngaymua) = 28) and (month(Ngaymua) = 9) and (year(Ngaymua) = 2020)

--Câu 13 Đưa ra SĐT của nhà cung cấp có địa chỉ ở 'Hà Nội' và cung cấp 'DELL GAMING'
select * from NHACUNGCAP
where DiachiCC = N'Hà Nội' and TenCC = N'DELL GAMING'

--Câu 14 Đếm số nhân viên theo từng cửa hàng
select MaCH,count(*) as 'So nhan vien' 
from NHANVIEN 
group by MaCH

--Câu 15 Đưa ra tổng lương của nhân viên theo từng cửa hàng
select MaCH,sum(Luong) as N'Tổng lương' from NHANVIEN
group by MaCH

--Câu 16 Đưa ra những nhân viên có địa chỉ Bùi Xương Trạch và có giới tính là Nam
select * from NHANVIEN
where Diachi like N'%Bùi Xương Trạch%' and Gioitinh = 'Nam'

--Câu 17 Đưa ra những nhân viên có lương bằng mức lương lớn nhất trong các nhân viên
select TenNV from NHANVIEN
where Luong = (select max(Luong) from NHANVIEN)

--Câu 18 Đưa ra 3 nhân viên lớn tuổi nhất sắp xếp theo thứ tự giảm dần
select top(3) TenNV, year(getdate()) - year(Ngaysinh) as N'Tuổi' from NHANVIEN
order by N'Tuổi' DESC

--Câu 19 Đưa ra những nhân viên đã qua sinh nhật 2 tháng và có giới tính là nữ 
select TenNV from NHANVIEN
where month(Ngaysinh) = month(GETDATE()) - 2 and Gioitinh = N'Nữ'

--Câu 20 Đưa ra tên những mặt hàng nhập trong năm 2021
select TenH from HOADONNHAP HDN, HANG H
where H.MaHDnhap = HDN.MaHDnhap and (year(Ngaynhap) = 2021)

--Câu 21 Đưa ra thông tin khách hàng có giá trị hóa đơn trên 100000
select distinct Tenkhach from KHACHHANG,HANG
where KHACHHANG.SĐT_Kh = HANG.SĐT_Kh and Dongia > 100000

--Câu 22 Đưa ra thông tin khách hàng mua sản phẩm DELL D30 vào ngày 29/6/2021
select Tenkhach  from KHACHHANG,HANG,HOADONXUAT
where (HANG.MaHDxuat = HOADONXUAT.MaHDxuat) and (Hang.SĐT_Kh = KHACHHANG.SĐT_Kh) and Ngayxuat = '6/29/2021'

--Câu 23 Đưa ra những nhân viên là quản lí
select * from NHANVIEN where MaNQL like '%QL%'

--Câu 24: Đưa ra tên sản phẩm được bán nhiều nhất trong tháng 6
select TenH, SoluongX as SL_max from HANG, HOADONXUAT
where Hang.MaHDxuat = HOADONXUAT.MaHDxuat
group by TenH, SoluongX having SoluongX >= (select Max(SoluongH) as SLlonnhat from HANG)

--Câu 25: Đưa ra thông tin khách hàng có SĐT: 0862455658
select Tenkhach,Ngaymua from KHACHHANG 
where SĐT_Kh = '0862455658'

--Câu 26: Đưa ra thông tin Nhân Viên phục vụ khách hàng có SĐT: 0879543647
select * from NHANVIEN, PHUCVU
where NHANVIEN.MaNV = PHUCVU.MaNV and SĐT_Kh = '0987654321'

--Câu 27: Đưa ra những sản phẩm được bán vào ngày 28/9/2020
select TenH,MaH from HANG,HOADONXUAT
where HANG.MaHDxuat = HOADONXUAT.MaHDxuat and Ngayxuat = '9/28/2020'

--Câu 28 Đưa ra thông tin những khách hàng mua hàng vào ngày 29/6/2021
select Tenkhach, SĐT_kh from KHACHHANG
where (month(Ngaymua) = 6) and (year(Ngaymua) = 2021)

--Câu 29: Đưa ra thông tin sản phẩm do NV2 bán ra
select TenH,MaH from HANG, HOADONXUAT
where HANG.MaHDxuat = HOADONXUAT.MaHDxuat and MaNV = 'NV2'

--Câu 30: Đưa ra tổng số mặt hàng do nhân viên có mã NV2 bán ra vào tháng 6
select sum(SoluongH) as TongH from HANG, HOADONXUAT
where (HANG.MaHDxuat = HOADONXUAT.MaHDxuat) and (month(Ngayxuat) = 6)

