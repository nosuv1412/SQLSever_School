-- I. Định nghĩa CSDL
-- Ý 1: Tạo CSDL
create database QLCH
use QLCH
-- Câu 1.1
drop table KHACH
create table KHACH
(
	Ma_khach nvarchar(15),
	Ten_khach nvarchar(30),
	Diachi_kh nvarchar (30),
	primary key (Ma_khach),
)
select * from KHACH
-- Câu 2.1
drop table HANG
create table HANG
(
	Ma_hang nvarchar(8),
	Ten_hang nvarchar(15),
	Mota_hang nvarchar(30),
	Don_vi nvarchar(10),
	primary key (Ma_hang),
)
select * from HANG
--Câu 3.1
drop table DONHANG
create table DONHANG
(
	So_don nvarchar(6),
	Ma_khach nvarchar(15),
	Ngay_don date,
	primary key (So_don),
	foreign key (Ma_khach) references KHACH(Ma_khach),
)
select * from DONHANG
-- Câu 4.1
drop table DONGDON
create table DONGDON
(
	So_don nvarchar(6),
	Ma_hang nvarchar(8),
	So_luongd int,
	foreign key (So_don) references DONHANG (So_don),
	foreign key (Ma_hang) references HANG (Ma_hang),
)
select * from DONGDON
--Câu 5.1
drop table PHIEUGIAO
create table PHIEUGIAO
(
	So_phieu nvarchar(6),
	Ma_khach nvarchar(15),
	Ngay_giao date,
	Noi_giao nvarchar(30),
	Tong_tien float,
	primary key (So_phieu),
	foreign key (Ma_khach) references KHACH(Ma_khach),
)
select * from PHIEUGIAO
-- Câu 6.1
drop table DONGPHIEU
create table DONGPHIEU
(
	So_phieu nvarchar(6),
	Ma_hang nvarchar(8),
	Don_gia float,
	So_luonggi float,
	foreign key (So_phieu) references PHIEUGIAO (So_phieu),
	foreign key (Ma_hang) references HANG (Ma_hang),
)
select * from DONGPHIEU

-- Ý 2: Sửa đổi cấu trúc
--1. Thêm 1 thuộc tính
Alter table KHACH 
	Add SoThich text;

Alter table HANG
	Add NoiCungCap text; 

Alter table HANG
	Add NoiSanXuat text;
--2. Thay đổi kiểu DL của 1 thuộc tính
Alter table KHACH 
	alter column SoThich nvarchar;

Alter table HANG
	alter column NoiCungCap nvarchar;

--3. Xóa 1 thuộc tính
Alter table HANG
	drop column NoiCungCap;
select * from HANG
Alter table HANG
	drop column NoiSanXuat;

Alter table KHACH
	drop column SoThich;
select * from KHACH
--II. Quản trị CSDL
-- Câu 1:
insert into KHACH (Ma_khach, Ten_khach, Diachi_kh)
values (N'K001', N'Đào Minh Thư', N'Đại học Quốc Gia'),
		(N'K002', N'Nguyễn Liên Dung', N'BNC'),
		(N'K003', N'Phạm Hoàng Nhung', N'Đại học Thủy Lợi')
select * from KHACH

insert into DONHANG (So_don, Ma_khach, Ngay_don)
values	(N'DH001', N'K001', '3/22/2002'),
		(N'DH002', N'K002', '7/13/2003'),
		(N'DH003', N'K003', '12/24/2002')
select * from DONHANG


insert into DONGDON (So_don, Ma_hang, So_luongd)
values	(N'DH001', N'H001', 10),
		(N'DH002', N'H002', 50),
		(N'DH003', N'H003', 5)
select * from DONGDON

insert into PHIEUGIAO (So_phieu, Ma_khach, Ngay_giao, Noi_giao, Tong_tien)
values	(N'SP001', N'K001', '3/25/2002', N'Hà Nội', 300.000),
		(N'SP002', N'K002', '7/18/2003', N'Thường Tín', 500.000),
		(N'SP003', N'K003', '12/26/2002', N'Đống Đa', 50.000)
select * from PHIEUGIAO

insert into DONGPHIEU (So_phieu, Ma_hang, Don_gia, So_luonggi)
values	(N'SP001', N'H001', 30.000, 10),
		(N'SP002', N'H002', 50.000, 5),
		(N'SP003', N'H003', 10.000, 5)
select * from DONGPHIEU

-- Câu 2: Thêm giá trị cho 1 số thuộc tính
insert into KHACH (Ma_khach, Ten_khach, Diachi_kh)
values	(N'K004', N'Trịnh Hồng Cường', N'   '),
		(N'K005', N'Nguyễn Văn Hải', N'Đại học Thủy Lợi')
select * from KHACH
insert into HANG
values	(N'H001', N'Hoa loa kèn', N'Hoa trắng, to', N'Bông'),
		(N'H002', N'Hoa hồng', N'Nhiều màu', N'Bông'),
		(N'H003', N'Hoa Lan', N'    ', N'Cành')
select * from HANG

-- Câu 3: Xóa hàng
-- Xóa 1 hàng có Ma_hang = 'H001' trong bảng HANG
delete from DONGDON
where Ma_hang like N'H001';

delete from DONGPHIEU
where Ma_hang like N'H001';

delete from HANG
where Ma_hang like N'H001';

-- Xóa tất cả khách hàng có Diachi_kh = 'Đại học Thủy Lợi' trong bảng KHACH
delete from KHACH
where (Ma_khach like N'K005' and Diachi_kh like N'Đại học Thủy Lợi');

delete from DONHANG
where Ma_khach like N'K003';
delete from PHIEUGIAO
where Ma_khach like N'K003';
delete from KHACH
where	(Ma_khach like N'K003' and Diachi_kh like N'Đại học Thủy Lợi');
-- Xóa khách hàng có tên là Trịnh Hồng Cường
delete from KHACH
where Ten_khach like N'Trịnh Hồng Cường';

--Câu 4: Sửa đổi gtri của 1 hàng
-- Sửa đổi địa chỉ của khách hàng thành địa chỉ ms là Đại học Quốc Gia với ma_khach là K002
UPDATE KHACH
SET Diachi_kh = N'Đại học Quốc Gia'
where Ma_khach = N'K002';

-- III. Các lệnh truy vấn dữ liệu
--1. Xem toàn bộ ND của bảng khách
select * from KHACH
-- 2. Xem toàn bộ ND của bảng hàng
select * from HANG
-- 3. Xem toàn bộ ND của bảng đơn hàng
select * from DONHANG
-- 4. Đưa ra tên và địa chỉ của tất cả các khách hàng trong bảng khách
select Ten_khach, Diachi_kh from KHACH
-- 5. Đưa ra Tên hàng, mô tả hàng và đơn vị tính của tất cả các mặt hàng trong bảng hàng
select Ten_hang, Mota_hang, Don_vi from HANG
-- 6. Đưa ra tất cả các đvi dùng để tính hàng hóa
select Don_vi from HANG
-- 7. Đưa ra tất cả các tên hàng trong bảng hàng
select Ten_hang from HANG
-- 8. Đưa ra tất cả các địa chỉ của khách hàng
select Diachi_kh from KHACH
-- 9. Đưa ra số phiếu, mã hàng, đơn giá, soluonggi và Thành tiền (don_gia*so_luong) của tất cả các hàng tỏng bảng PHIEUGIAO
select So_phieu, Ma_hang, Don_gia, So_luonggi, (Don_gia*So_luongd) from DONGDON, DONGPHIEU
where DONGDON.Ma_hang = DONGPHIEU.Ma_hang
-- 10. Đưa ra so_phieu, ma_hang, don_gia, soluonggi và Thành tiền (don_gia*so_luong), sử dụng bí danh la thanh_tien của tất cả các hàng trong bảng PHIEU_GIAO
select So_phieu, Ma_hang, Don_gia, So_luonggi, (Don_gia*So_luongd) as Thanh_tien from DONGDON, DONGPHIEU
where DONGDON.Ma_hang = DONGPHIEU.Ma_hang
-- 11. Đưa ra tất cả giá trị của bảng HANG theo thứ tự giảm dần của ma_hang.
select * from HANG order by Ma_hang DESC
-- 12. Đưa ra tất cả các giá trị của bảng PHIEUGIAO theo thứ tự tăng dần (giảm dần) của tổng tiền (tong_tien).
select * from PHIEUGIAO order by Tong_tien ASC
select * from PHIEUGIAO order by Tong_tien DESC
-- 13. Đưa ra tất cả các khách hàng có địa chỉ là Đại học Quốc Gia trong bảng KHACH.
select * from KHACH where Diachi_kh = N'Đại học Quốc Gia'
-- 14. Đưa ra So_phieu, Ma_khach trong bảng PHIEUGIAO với điều kiện Tong_ tien>=100.000, và sắp xếp theo điều kiện giảm dần của Tong_tien.
select So_phieu, Ma_khach from PHIEUGIAO where Tong_tien >= 100.000 order by Tong_tien DESC
-- 15. Đưa ra ten_hang, mota_hang của những hàng hóa có don_vi được tính theo bông trong bảng HANG.
select Ten_hang, Mota_hang from HANG where Don_vi = N'Bông'
-- 16. Đưa ra danh sách các bản ghi bao gồm so_phieu, ma_khach, ngay_giao trong bảng PHIEUGIAO với điều kiện Noi_giao là Hà Nội và Tong_tien>50.000.
select So_phieu, Ma_khach, Ngay_giao from PHIEUGIAO where Noi_giao = N'Hà Nội' and Tong_tien > 50.000
-- 17. Đưa ra danh sách các bản ghi bao gồm Ma_khach, Ten_khach trong bảng KHACH với điều kiện địa chỉ của khách ở Đại học Quốc Gia hoặc Đại học Thủy Lợi.

-- 18. Đưa ra những mặt hàng trong bảng HANG có đơn vị tính là Bông, Cành hoặc Bó.
-- 19. Đưa ra danh sách những khách hàng (Ma_khach, Tong_tien) nằm trong bảng PHIEUGIAO có Noi_giao nằm trong số các địa điểm sau: Hà Nội, Hồ Chí Minh, Hải Phòng.
-- 20. Đưa ra tất cả những thông tin trong bảng PHIEUGIAO với điều kiện tong_tien nằm trong khoảng từ 100.000 đến 500.000.
-- 21. Đưa ra ma_kh, ten_kh trong bảng KHACH của những khách hàng có họ là Nguyễn.
-- 22. Đếm số lần mua hàng của khách hàng có ma_kh là K001 trong bảng PHIEUGIAO. Thuộc tính mới này được đặt tên là SoLanMua.
-- 23. Tính tổng tiền trung bình của mỗi PHIEUGIAO. Thuộc tính mới này được đặt tên là TrungBinhPG.
-- 24. Tính tổng tiền trong bảng PHIEUGIAO của những khách hàng có ma_khach = ‘K002’.
-- 25. Tính tổng số các khách hàng trong bảng KHACH có địa chỉ (diachi_KH) là Đại học Thủy Lợi.
-- 26. Đưa ra ma_khach, ngay_giao, noi_giao trong bảng PHIEUGIAO có tong_tien thanh toán lớn nhất.

-- 27. Đưa ra ma_khach, ngay_giao, noi_giao trong bảng PHIEUGIAO có tong_tien thanh toán nhỏ nhất.

