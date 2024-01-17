create database QLPhong
use QLPhong

drop table Thuephong
create table Thuephong
(
	Ngaythue date,
	Makhach nvarchar (6),
	Maphong nvarchar(5),
	primary key (Ngaythue, Makhach, Maphong),
)

drop table Khach
create table Khach
(
	Makhach nvarchar(6),
	Tenkhach nvarchar (30),
	primary key (Makhach),
)

insert into Thuephong (Ngaythue, Makhach, Maphong)
values	('4/21/2021', 'K01', 'P08'),
		('5/5/2021', 'K02', 'P09'),
		('6/18/2021', 'K03', 'P10'),
		('7/7/2021', 'K04', 'P11'),
		('7/7/2021', 'K05', 'P12'),
		('9/10/2021', 'K06', 'P10'),
		('10/5/2021', 'K07', 'P02'),
		('10/20/2021', 'K08', 'P01')

insert into Khach (Makhach, Tenkhach)
values	('K01', N'Trần Thanh Thảo'),
		('K02', N'Nguyễn Việt Hoàng'),
		('K03', N'Nguyễn Thị Ngân'),
		('K05', N'Đỗ Trọng Nguyên'),
		('K06', N'Hoàng Phi Dương'),
		('K07', N'Tô Hương Quỳnh'),
		('K08', N'Trần Trọng Việt')
select * from Thuephong
select * from Khach

-- 2. Đưa ra thông tin Ngày thuê, tên khách thuê phòng trong tháng 10/2021
select Ngaythue, Tenkhach from Thuephong, Khach 
where Thuephong.Makhach = Khach.Makhach and 
Ngaythue in (select Ngaythue from Thuephong where (month(Ngaythue)=10) and (year(Ngaythue)=2021));

--3. Đưa ra những phòng có số lần thuê nhiều nhất
select Maphong, count (*) as SL_P from Thuephong group by Maphong
-- 4. Thống kê tổng số khách thuê của mỗi ngày trong năm 2021
select Ngaythue, count (*) as SL_khach from Thuephong group by Ngaythue

select Tenkhach, count (Tenkhach) as tongsokhachthue from Khach group by Tenkhach