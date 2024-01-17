create database QLgv
use QLgv

create table Giangvien 
(
	MaGV nvarchar(5),
	Hoten nvarchar(30),
	Diachia nvarchar (30),
	Ngaysinh date,
	primary key (MaGV),
)

create table Detai 
(
	MaDT nvarchar(5),
	TenDT nvarchar(20),
	Cap varchar(5) ,
	Kinhphi int,
	primary key (MaDT),
)

create table Thamgia
(
	MaGV nvarchar (5),
	MaDT nvarchar (5),
	Sogio int,
	primary key (MaGV, MaDT),
)

insert into Giangvien (MaGV, Hoten, Diachia, Ngaysinh)
values	('G1', N'Hoàng Thị Lan', N'Tây Hồ', '1980/8/10'),
		('G2', N'Nguyễn Thị Nga', N'Cầu Giấy', '1975/9/25'),
		('G3', N'Bùi Thu Thảo', N'Thường Tín', '1999/7/10'),
		('G4', N'Trương Xuân Nam', N'Hà Nội', '1976/10/5'),
		('G5', N'Hồ Tùng Mậu', N'Thanh Oai', '1970/2/1')

insert into Detai (MaDT, TenDT, Cap, Kinhphi)
values	('D1', N'Đề tài 1', N'Ths', 500),
		('D2', N'Đề tài 2', N'Ts', 400),
		('D3', N'Đề tài 3', N'kĩ sư', 900),
		('D4', N'Đề tài 4', N'Ths', 700),
		('D5', N'Đề tài 5', N'Ts', 770)

insert into Thamgia(MaGV, MaDT, Sogio)
values	('G1', 'D2', 15),
		('G1', 'D4', 8),
		('G3', 'D1', 24),
		('G2', 'D3', 12),
		('G1', 'D5', 16),
		('G4', 'D2', 15)

select * from Giangvien
select * from Detai
select * from Thamgia
-- 3. Cho biết tên và ngày sinh của giảng viên sống ở quận Tây Hồ và tên các đề tài mà giảng viên này tham gia.
select Hoten, Ngaysinh, TenDT from Giangvien, Detai,Thamgia
where (Giangvien.MaGV = Thamgia.MaGV) and (Thamgia.MaDT = Detai.MaDT)
and Diachia like N'Tây Hồ'

-- 4. Đưa ra mã giảng viên, tên giảng viên và tổng số giờ tham gia nghiên cứu khoa học của từng giảng viên
select Hoten, sum(Sogio) as Tongsogio from Giangvien, Thamgia
where Giangvien.MaGV = Thamgia.MaGV group by Hoten

-- 5. Tên gv tham gia nhiều đề tài nhtaas
