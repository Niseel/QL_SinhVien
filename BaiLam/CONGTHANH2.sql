-- Server CNTT - CONGTHANH2

SELECT * FROM MONHOC
SELECT * FROM KHOA
SELECT * FROM LOP
SELECT * FROM SINHVIEN
SELECT * FROM DIEM






































-- Chạy View v_DSSINHVIEN 
CREATE VIEW v_DSSINHVIEN
as
	SELECT MaSV, Ho + ' ' + Ten as HoTen FROM SINHVIEN
	UNION
	SELECT MaSV, Ho + ' ' + Ten as HoTen FROM LINK.QL_SinhVien.DBO.SINHVIEN

-- Chạy View v_DSSINHVIEN
SELECT * FROM v_DSSINHVIEN



-- Câu 3

SELECT d.MaSV, sv.Ho + ' ' + sv.Ten as HoTen, m.TenMH, d.DIEM
FROM DIEM as d, MONHOC as m, SINHVIEN as sv
WHERE d.MaSV = N'31194835'
AND m.MaMH = d.MaMH 
AND d.MaSV = sv.MaSV
UNION
SELECT d.MaSV, sv.Ho + ' ' + sv.Ten as HoTen, m.TenMH, d.DIEM
FROM LINK.QL_SinhVien.DBO.DIEM as d, LINK.QL_SinhVien.DBO.MONHOC as m, LINK.QL_SinhVien.DBO.SINHVIEN as sv
WHERE d.MaSV = N'31194835'
AND m.MaMH = d.MaMH 
AND d.MaSV = sv.MaSV

--Viết 1 store procedure sp_THONGTINDIEM in ra thông tin điểm các môn học 
--của sinh viên có mã sinh viên là @MASV nhập vào 
--(hiển thị các thông tin MASV, HOTEN, TENMH, DIEM) (2đ)

CREATE PROC sp_THONGTINDIEM
@masv nchar(8)
as
BEGIN
	SELECT d.MaSV, sv.Ho + ' ' + sv.Ten as HoTen, m.TenMH, d.DIEM
	FROM DIEM as d, MONHOC as m, SINHVIEN as sv
	WHERE d.MaSV = @masv
	AND m.MaMH = d.MaMH 
	AND d.MaSV = sv.MaSV
	UNION
	SELECT d.MaSV, sv.Ho + ' ' + sv.Ten as HoTen, m.TenMH, d.DIEM
	FROM LINK.QL_SinhVien.DBO.DIEM as d, LINK.QL_SinhVien.DBO.MONHOC as m, LINK.QL_SinhVien.DBO.SINHVIEN as sv
	WHERE d.MaSV = @masv
	AND m.MaMH = d.MaMH 
	AND d.MaSV = sv.MaSV
END
-- 31194835 là mã số sinh viên của Server TOAN (311"48"35) - mã 48 là khoa Toan
EXEC sp_THONGTINDIEM @masv = N'31194835'
