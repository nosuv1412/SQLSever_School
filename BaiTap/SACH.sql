create database SACH
use Sach
drop table DOCGIA
create table DOCGIA
(
	MaDG nvarchar(6) not null primary key,
	Hoten nvarchar(30),
	Hocvi nvarchar (15),
)

insert into DOCGIA (MaDG, Hoten, Hocvi)
values	(N'DG001', N'Nguyễn Việt Hoàng', N'Tiến sĩ'),
		(N'DG002', N'Trần Thanh Thảo', N'Thạc sĩ'),
		(N'DG003', N'Nguyễn Văn Sinh', N'Đại học'),
		(N'DG004', N'Nguyễn Văn B', N'Đại học'),
		(N'DG005', N'Nguyễn Văn C', N'Đại học'),
		(N'DG006', N'Trần Trọng Việt', N'Kĩ sư')

drop table SACHMUON
create table SACHMUON
(
	MaDG nvarchar(6),
	Tensach nvarchar (20),
	Sotrang int,
	Ngaymuon datetime,
	Ngaytra date,
	primary key (MaDG, Tensach)
)

insert into SACHMUON (MaDG, Tensach, Sotrang, Ngaymuon, Ngaytra)
values	(N'DG001', N'Cơ sở dữ liệu', 300,  '1/1/2011', '3/22/2011'),
		(N'DG002', N'Toán rời rạc', 250,  '4/16/2012', '5/20/2013'),
		(N'DG003', N'Triết học', 150, '7/7/2013', '10/25/2014'),
		(N'DG003', N'Toán', 150, '7/8/2013', '10/25/2014'),
		(N'DG001', N'Nhập môn', 400, '10/18/2021', '11/10/2021')

select * from DOCGIA
select * from SACHMUON

--- 3. Đưa ra tên, học vị của các độc giả đã mượn sách
select distinct Hoten, Hocvi from DOCGIA, SACHMUON where DOCGIA.MaDG = SACHMUON.MaDG

-- 4. Đưa ra những độc giả chưa mượn sách lần nào từ 1/1/2011
select *
from DOCGIA
where DOCGIA.MaDG not in
(select SACHMUON.MaDG from SACHMUON where Ngaymuon = '1/1/2011')

select Hoten from DOCGIA, SACHMUON
where DOCGIA.MaDG = SACHMUON.MaDG and
Ngaymuon not in (select Ngaymuon from SACHMUON where (day(Ngaymuon) = 1) and (month(Ngaymuon) = 1) and (year(Ngaymuon) = 2011));


-- 5. Đưa ra những độc giả có nhiều lần mượn sách nhất
select * from DOCGIA
where MaDG = (select max(MaDG) from SACHMUON)

select Top 2 Hoten, count (*) as SLM from DOCGIA, SACHMUON
where DOCGIA.MaDG = SACHMUON.MaDG group by Hoten

-- 6. Đưa ra tên, học vị của các độc giả đã mượn sách vào ngày '18/10/2021'
select Hoten, Hocvi from DOCGIA, SACHMUON 
where DOCGIA.MaDG = SACHMUON.MaDG and Ngaymuon = '10/18/2021'

--7. Thống kê số sách được mượn mỗi ngày
select Ngaymuon, Tensach, count (*) as SL_sach from SACHMUON group by Ngaymuon, Tensach

-- 8. Đưa ra những độc giả có số lần mượn sách lớn hơn trung bình số lần mượn sách của các độc giả
select * from DOCGIA, SACHMUON
where Tensach = (select count (*) as SLM from DOCGIA, SACHMUON)  > (select 
