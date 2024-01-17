create database QLsach
use QLsach

create table Dausach
(
	MaDS nvarchar(5),
	NXB nvarchar(20),
	LoaiS nvarchar(25),
	TenS nvarchar (30),
	NamXB int,
	Tacgia nvarchar (30),
	Soluong int,
	primary key (MaDS),
)

create table Nhaxuatban
(
	NXXB nvarchar(20),



create database sach
use sach 

drop table DAUSACH
create table DAUSACH 
( 
	MaDS nvarchar(50) not null primary key , 
	NXB nvarchar(50) ,
	LoaiS nvarchar(50) , 
	TenS nvarchar(50) , 
	NamXB nvarchar(50) , 
	TacGia nvarchar(50) , 
	SoLuong int,
	foreign key(NXB) references NHAXUATBAN(NXB)
) 
select * from DAUSACH
drop table NHAXUATBAN
create table NHAXUATBAN
(
	NXB nvarchar(50) not null primary key ,
	TenNXB nvarchar(50),
	DiaChi nvarchar(50),
)

insert into DAUSACH(MaDS,NXB,LoaiS,TenS,NamXB,TacGia,SoLuong) 
values (N'01',N'ABC',N'Truyện Tranh',N'Conan','2002','EDo',800),
(N'02',N'BCD',N'Truyện Tranh',N'Thủ lĩnh thẻ bài','2004','Abo',20000),
(N'03',N'CDE',N'Tiểu Thuyết',N'Trăng Non','2006','Nam Cao',400),
(N'04',N'DEF',N'Tiểu thuyết',N'Những người khốn khổ','2002','Cdo',20000),
(N'05',N'Văn học',N'Tiểu thuyết',N'Những người khốn khổ','2002','Cdo',20000)




insert into NHAXUATBAN(NXB,TenNXB,DiaChi) 
values  
('ABC',N'Cá chép',N'Thái Hà'),
('BCD',N'Tiền Phong',N'Thái Thịnh'),
('CDE',N'Thành Công',N'Thanh Xuân'),
('DEF',N'ABC',N'Trung Văn'),
(N'Văn học',N'Kim Đồng',N'Thái Hà')
delete from NHAXUATBAN
select * from NHAXUATBAN
select * from DAUSACH
--3) Đưa ra mã và tên các đầu sách xuất bản bởi nhà xuất bản có tên "Kim Đồng" và có số lượng >500
select * from DAUSACH,NHAXUATBAN
where (DAUSACH.NXB=NHAXUATBAN.NXB) and (TenNXB=N'Kim Đồng') and (SoLuong>500)

--4. Đếm số đầu sách của mỗi năm xuất bản
select count(*)
from DAUSACH
group by NamXB

--5. Đếm số đầu sách của nhà xuất bản “Văn học”
select count(*) from DAUSACH
where NXB = N'Văn học'