--TẠO DATABASE
create database quanlybanhang
--TẠO BẢNG BỘ PHẬN
create table BOPHAN(
MaBP char(3) not null primary key,
TenBP nvarchar(30)
)
--TẠO BẢNG NHÂN VIÊN
create table NHANVIEN(
MaNV char(3) not null primary key,
TenNV nvarchar(30),
Gioitinh char(3),
Diachi nvarchar(30),
SDT char(10),
MaBP char(3),
foreign key (MaBP) references BOPHAN(MaBP)
)
--TẠO BẢNG KHÁCH
create table KHACH(
MaK char(5) not null primary key,
TenK nvarchar(30),
Diachi nvarchar(30),
SDT char(10)
)
--TẠO BẢNG NHÀ CUNG CẤP
create table NHACC(
TenNCC nvarchar(30) not null primary key,
Diachi nvarchar(30)
)
--TẠO BẢNG HOÁ ĐƠN
create table HOADON(
SoHD char(5) not null primary key,
NgayHD date,
NgayGiao date,
MaNV char(3),
MaK char(5),
foreign key (MaNV) references NHANVIEN(MaNV),
foreign key (MaK) references KHACH(MaK)
)
--TẠO BẢNG SẢN PHẨM
create table SANPHAM(
MaSP char(5) not null primary key,
TenSP nvarchar(30),
Dongia int,
SoHD char(5),
foreign key (SoHD) references HOADON(SoHD)
)
--TẠO BẢNG CUNG CẤP
create table CUNGCAP(
TenNCC nvarchar(30),
MaSP char(5),
foreign key (TenNCC) references NHACC(TenNCC),
foreign key (MaSP) references SANPHAM(MaSP)
)

--NHẬP BỘ GIÁ TRỊ
insert into BOPHAN
values ('PKD', N'Phòng Kinh Doanh'),
('CH1', N'Cửa hàng 1'),
('CH2', N'Cửa hàng 2');

insert into NHANVIEN
values ('001', N'Đặng Văn Dương', 'Nam', N'776 Tố Hữu', '0327428135', 'PKD'),
('002', N'Nguyễn Hữu Trường', 'Nam', N'610 Trung Văn', '0343303182', 'CH1'),
('003', N'Vũ Thanh Sơn', 'Nam', N'809 Tây Sơn', '0160450127', 'CH2'),
('004', N'Nguyễn Văn A', 'Nam', N'181 Lý Thái Tổ', '0478307054', 'PKD'),
('005', N'Đào Thị Trâm', 'Nu', N'473 Lê Lợi', '0121446561', 'CH1'),
('006', N'Lê Hùng', 'Nam', N'247 Trần Hưng Đạo', '0275124224', 'CH2'),
('007', N'Đặng Như Kiều', 'Nu', N'635 Nguyễn Công Trứ', '0641641061', 'PKD'),
('008', N'Nguyễn Minh Hằng', 'Nu', N'480 Lê Văn Lương', '0210758741', 'CH1'),
('009', N'Lê Thị Phương Thảo', 'Nu', N'712 Đường Láng', '0881191461', 'CH2');

insert into KHACH
values ('KH001', N'Anh Việt', N'Đống Đa', '0886547901'),
('KH002', N'Highlands Coffee', N'Đống Đa', '0889450210'),
('KH003', N'Tiệm Bánh K', N'Cầu Giấy', '0883562103'),
('KH004', N'Quang Cường', N'Nam Từ Liêm', '0933897290'),
('KH005', N'Quán Cháo Sáng', N'Hà Đông', '0193246612'),
('KH006', N'Meta Company', N'Đống Đa', '0121510800'),
('KH007', N'Viết Hoàng', N'Gia Lâm', '0201516190'),
('KH008', N'Việt Thái', N'Hoàn Kiếm', '0629406931'),
('KH009', N'Chị Chi', N'Nam Từ Liêm', '0717973001'),
('KH010', N'Anh Dương', N'Nam Từ Liêm', '0736321690');

insert into NHACC
values (N'Hiệu sách TL', N'Đống Đa'),
(N'Circle K', N'Nam Từ Liêm'),
(N'Điện Máy Xanh', N'Cầu Giấy');

insert into HOADON
values ('HD002', '2020-06-26', '2020-07-02', '004', 'KH003'),
('HD004', '2020-08-04', '2020-08-06', '004', 'KH009'),
('HD005', '2021-08-05', '2021-08-10', '009', 'KH005'),
('HD008', '2021-10-21', '2021-10-30', '008', 'KH003'),
('HD011', '2021-02-16', '2021-03-12', '003', 'KH007');

insert into SANPHAM
values ('H0001', N'Tủ lạnh Sharp', 4500000, 'HD002'),
('H0002', N'Bút chì đen', 1000, 'HD004'),
('H0003', N'Thùng Pepsi', 80000, 'HD005'),
('H0004', N'Thùng Nước Yến', 120000, 'HD008'),
('H0005', N'Nồi cơm điện Toshiba', 1350000, 'HD011'),
('H0006', N'Laptop', 15000000, null);

insert into CUNGCAP
values (N'Hiệu sách TL', 'H0002'),
(N'Circle K', 'H0002'),
(N'Circle K', 'H0003'),
(N'Circle K', 'H0004'),
(N'Điện Máy Xanh', 'H0001');

--Nguyễn Hữu Trường
--Qry1. Cho biết Họ và Tên, địa chỉ và số điện thoại của các Nhân viên
select TenNV, Diachi, SDT from NHANVIEN
 
 
--Qry2. Cho biết mã khách hàng, tên khách hàng, địa chỉ khách hàng mà tên là Dương
select MaK, TenK, Diachi from KHACH 
where TenK like N'% Dương'
 
--Qry3. Cho biết tên khách hàng, số điện thoại của những khách hàng có địa chỉ ở Đống Đa
select TenK, SDT from KHACH 
where Diachi like N'Đống Đa'
 
--Qry4. Cho biết tên Sản phẩm và đơn giá của các sản phẩm
select TenSP, Dongia from SANPHAM
 
--Qry5. Lập danh sách các nhân viên Nam thuộc bộ phận có mã là PKD:
select TenNV from NHANVIEN
where (Gioitinh='Nam') and (MaBP='PKD')
 
--Qry6. Lập danh sách các sản phẩm (TENSP, Dongia) của các sản phẩm có đơn giá từ 500.000 trở lên.
select TenSP, Dongia from SANPHAM 
where Dongia>=500000;
 
 
--Qry7: Liệt kê họ tên nhân viên và số hoá đơn, ngày hoá đơn, mã khách hàng do nhân viên đó đảm nhận
select TenNV, SoHD, NgayHD, MaK from NHANVIEN NV, HOADON HD
where NV.MaNV=HD.MaNV 
--Qry8. Cho biết các thông tin về nhân viên có tên Trường:
select * from NHANVIEN 
where TenNV like N'% Trường'
 
--Qry9. Đưa ra sản phẩm có đơn giá nhỏ hơn đơn giá trung bình các sản phẩm
select * from SANPHAM
where Dongia > (select AVG(Dongia) from SANPHAM)
 
--Qry 10. Đưa ra sản phẩm có đơn giá bằng đơn giá nhỏ nhất trong sản phẩm
select * from SANPHAM
where Dongia = (select min(Dongia) from SANPHAM)
 
 
--Vũ Thanh Sơn
--Qry1. Cho biết các thông tin về sản phẩm
select * from SANPHAM
 
--Qry2. Cho biết tên các nhân viên là nữ và số điện thoại có 2 số cuối là 61:
select TenNV, SDT from NHANVIEN
where Gioitinh='Nu' and SDT like '%61'
 
--Qry3. Cho biết thông tin các hóa đơn trong năm 2020:
select * from HOADON
where year(NgayHD)=2020
 
--Qry4. Cho biết nhà cung cấp có địa chỉ tại Cầu Giấy:
select TenNCC from NHACC
where Diachi like N'Cầu Giấy'
 
--Qry5: Cho biết Phòng kinh doanh đã bán những sản phẩm nào
select TenSP
from BOPHAN BP, NHANVIEN NV, HOADON HD, SANPHAM SP
where SP.SoHD=HD.SoHD and HD.MaNV=NV.MaNV and NV.MaBP=BP.MaBP and BP.TenBP=N'Phòng Kinh Doanh'
 
 
--Qry6. Đưa ra mã sản phẩm của những mặt hàng do Circle K cung cấp:
select MaSP from CUNGCAP
where TenNCC like N'Circle K'
 
--Qry7. Đưa ra sản phẩm có đơn giá bằng đơn giá lớn nhất trong sản phẩm
select * from SANPHAM
where Dongia = (select max(Dongia) from SANPHAM)
 
--Qry8: Cho biết họ tên nhân viên đã lập những hóa đơn nào (số hoá đơn), tên sản phẩm, đơn giá
select TenNV, HD.SoHD, TenSP, Dongia from NHANVIEN NV, HOADON HD, SANPHAM SP
where NV.MaNV=HD.MaNV and HD.SoHD=SP.SoHD 
--Qry9: Đưa ra những khách hàng chỉ mua hàng 1 lần
select * from KHACH K, HOADON HD
where HD.MaK=K.MaK AND HD.MaK IN (select MaK from HOADON group by MaK having COUNT(Mak)= 1)  
--Qr10: Đưa ra những sản phẩm chưa được bán
select * from SANPHAM
where MaSP not in (select MaSP from SANPHAM SP, HOADON HD where SP.SoHD=HD.SoHD)
 
 
--Đặng Văn Dương
--Qry1. Cho biết các thông tin về các nhân viên có đầu số điện thoại 032:
select * from NHANVIEN 
where SDT like '032%'
 
--Qry2. Cho biết thông tin về các Nhân viên có tên là Kiều và là nữ:
select * from NHANVIEN
where TenNV like N'% Kiều' and Gioitinh like 'Nu';
 
--Qry3. Cho biết các Hoá đơn (SoHD, NgayHD) được giao hàng vào tháng 10/2021:
select SoHD, NgayHD from HOADON
where (month(NgayGiao)=10) and (year(NgayGiao)=2021)
 
--Qry4. Cho biết các sản phẩm có đơn giá từ 1 triệu trở lên:
select TenSP, Dongia from SANPHAM
where Dongia>=1000000
 
--Qry5. Cho biết các sản phẩm Nồi cơm điện có đơn giá trong khoảng từ 1 triệu đến 3 triệu
select TenSP from SANPHAM 
where TenSP like N'Nồi cơm điện %' and Dongia between 1000000 and 3000000
 
--Qry6. Cho biết các thông tin các sản phẩm Sharp và Toshiba
select * from SANPHAM 
where TenSP like '% Sharp%' or TenSP like '% Toshiba%'
 
 
--Qry7: Liệt kê số hoá đơn, ngày hoá đơn, tên khách hàng, tên nhân viên của các hoá đơn phát sinh trong tháng 8/2021
select SoHD, NgayHD, TenK, TenNV
from HOADON HD, KHACH K, NHANVIEN NV
where HD.MaK = K.MaK and HD.MaNV = NV.MaNV and year(HD.NgayHD)=2021 and month(HD.NgayHD)=8
 
--Qry8: Cho biết tên khách hàng, tên sản phẩm mà khách hàng đó mua từ nhà cung cấp Circle K
select TenK, TenSP
from KHACH K, SANPHAM SP, CUNGCAP CC, HOADON HD
where K.MaK=HD.MaK and SP.SoHD=HD.SoHD and CC.MaSP=SP.MaSP and CC.TenNCC=N'Circle K'
 
--Qry9: Đưa ra những sản phẩm không được bán trong năm 2021
select * from SANPHAM
where MaSP not in ( select MaSP from SANPHAM SP, HOADON HD where SP.SoHD=HD.SoHD and YEAR(NgayHD)=2021)
 
--Qry10: Đưa ra top 3 những mặt hàng có giá cao nhất
select * from SANPHAM
where Dongia in ( select top 3 Dongia from SANPHAM order by Dongia desc)
 
 
