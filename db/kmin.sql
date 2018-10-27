-- MySQL Script generated by MySQL Workbench
-- Wed Oct 24 09:02:21 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema kmin
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `kmin` ;

-- -----------------------------------------------------
-- Schema kmin
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `kmin` ;

-- -----------------------------------------------------
-- Table `kmin`.`CHUYEN_NGANH`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`CHUYEN_NGANH` ;

CREATE TABLE IF NOT EXISTS `kmin`.`CHUYEN_NGANH` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TenChuyenNganh` NVARCHAR(30) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`LOP_HOC`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`LOP_HOC` ;

CREATE TABLE IF NOT EXISTS `kmin`.`LOP_HOC` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TenLop` VARCHAR(45) NOT NULL,
  `ID_ChuyenNganh` INT NOT NULL,
  `HinhCover` VARCHAR(100) NULL,
  `YeuCauDauVao` NVARCHAR(1000) NULL,
  `GioiThieu` TEXT(10000) NULL,
  `TomTat` NVARCHAR(1000) NULL,
  `DeCuong` TEXT(20000) NULL,
  `MucTieu` NVARCHAR(2000) NULL,
  `ThoiLuong` NVARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `id_chuyen_nganh_idx` (`ID_ChuyenNganh` ASC) VISIBLE,
  CONSTRAINT `id_chuyen_nganh`
    FOREIGN KEY (`ID_ChuyenNganh`)
    REFERENCES `kmin`.`CHUYEN_NGANH` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`HOC_VIEN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`HOC_VIEN` ;

CREATE TABLE IF NOT EXISTS `kmin`.`HOC_VIEN` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `HoLot` NVARCHAR(40) NOT NULL,
  `Ten` NVARCHAR(10) NOT NULL,
  `GioiTinh` TINYINT NOT NULL,
  `DonViCongTac` NVARCHAR(45) NULL,
  `Email` VARCHAR(50) NULL,
  `SDT` VARCHAR(10) NOT NULL,
  `Facebook` VARCHAR(40) NULL,
  `Password` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`PROJECT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`PROJECT` ;

CREATE TABLE IF NOT EXISTS `kmin`.`PROJECT` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_Lop` INT NOT NULL,
  `ID_TacGia` INT NOT NULL,
  `Ten` NVARCHAR(50) NOT NULL,
  `Link` LONGTEXT NOT NULL,
  `NgayTao` DATETIME NOT NULL,
  `LuotView` INT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  INDEX `project_id_tacgia_idx` (`ID_TacGia` ASC) VISIBLE,
  INDEX `project_id_lop_idx` (`ID_Lop` ASC) VISIBLE,
  CONSTRAINT `project_id_lop`
    FOREIGN KEY (`ID_Lop`)
    REFERENCES `kmin`.`LOP_HOC` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `project_id_tacgia`
    FOREIGN KEY (`ID_TacGia`)
    REFERENCES `kmin`.`HOC_VIEN` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`KHOA_HOC`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`KHOA_HOC` ;

CREATE TABLE IF NOT EXISTS `kmin`.`KHOA_HOC` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_Lop` INT NOT NULL,
  `TenKhoa` NVARCHAR(45) NOT NULL,
  `NgayKhaiGiang` DATETIME NOT NULL,
  `HocPhiGoc` INT NOT NULL,
  `HocPhiThiTruong` INT NOT NULL,
  `ThoiKhoaBieu` VARCHAR(8) NULL,
  PRIMARY KEY (`ID`),
  INDEX `id_lop_idx` (`ID_Lop` ASC) VISIBLE,
  CONSTRAINT `id_lop`
    FOREIGN KEY (`ID_Lop`)
    REFERENCES `kmin`.`LOP_HOC` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`FREE_COURSE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`FREE_COURSE` ;

CREATE TABLE IF NOT EXISTS `kmin`.`FREE_COURSE` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TenKhoa` VARCHAR(45) NOT NULL,
  `Link` TEXT(300) NOT NULL,
  `NgayTao` DATETIME NOT NULL,
  `DeCuong` NVARCHAR(1500) NOT NULL,
  `ID_ChuyenNganh` INT NOT NULL,
  `DanhGiaTrungBinh` FLOAT NULL DEFAULT 0,
  `LuotView` INT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  INDEX `id_chuyen_nganh_free_idx` (`ID_ChuyenNganh` ASC) VISIBLE,
  CONSTRAINT `id_chuyen_nganh_free`
    FOREIGN KEY (`ID_ChuyenNganh`)
    REFERENCES `kmin`.`CHUYEN_NGANH` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`DANH_GIA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`DANH_GIA` ;

CREATE TABLE IF NOT EXISTS `kmin`.`DANH_GIA` (
  `ID_FreeCourse` INT NOT NULL,
  `ID_HocVien` INT NOT NULL,
  `NgayTao` DATETIME NOT NULL,
  `NoiDung` NVARCHAR(100) NULL,
  `Sao` TINYINT(5) NOT NULL,
  PRIMARY KEY (`ID_FreeCourse`, `ID_HocVien`),
  INDEX `danhgia_id_hocvien_idx` (`ID_HocVien` ASC) VISIBLE,
  CONSTRAINT `danhgia_id_freecourse`
    FOREIGN KEY (`ID_FreeCourse`)
    REFERENCES `kmin`.`FREE_COURSE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `danhgia_id_hocvien`
    FOREIGN KEY (`ID_HocVien`)
    REFERENCES `kmin`.`HOC_VIEN` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`DANG_KY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`DANG_KY` ;

CREATE TABLE IF NOT EXISTS `kmin`.`DANG_KY` (
  `ID_HocVien` INT NOT NULL,
  `ID_KhoaHoc` INT NOT NULL,
  `ThoiGianDangKy` DATETIME NOT NULL,
  `ID_NhomTruong` INT NULL,
  `UuDai` NVARCHAR(20) NULL,
  `HinhThucHoc` VARCHAR(8) NOT NULL,
  `HocPhi` INT NOT NULL,
  `BuoiHoc` VARCHAR(90) NULL,
  PRIMARY KEY (`ID_HocVien`, `ID_KhoaHoc`),
  INDEX `dangly_id_khoahoc_idx` (`ID_KhoaHoc` ASC) VISIBLE,
  CONSTRAINT `dangky_id_hocvien`
    FOREIGN KEY (`ID_HocVien`)
    REFERENCES `kmin`.`HOC_VIEN` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `dangly_id_khoahoc`
    FOREIGN KEY (`ID_KhoaHoc`)
    REFERENCES `kmin`.`KHOA_HOC` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`LOAI_NHAN_VIEN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`LOAI_NHAN_VIEN` ;

CREATE TABLE IF NOT EXISTS `kmin`.`LOAI_NHAN_VIEN` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TenLoaiNV` NVARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`NHAN_VIEN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`NHAN_VIEN` ;

CREATE TABLE IF NOT EXISTS `kmin`.`NHAN_VIEN` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_LoaiNV` INT NOT NULL,
  `HoLot` NVARCHAR(40) NOT NULL,
  `Ten` NVARCHAR(10) NOT NULL,
  `GioiTinh` TINYINT NOT NULL,
  `NgheNghiep` NVARCHAR(45) NOT NULL,
  `Avata` TEXT(100) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `SDT` VARCHAR(10) NOT NULL,
  `Facebook` VARCHAR(40) NOT NULL,
  `ThongTin` NVARCHAR(200) NOT NULL,
  `QuanDiemSong` NVARCHAR(100) NULL,
  PRIMARY KEY (`ID`),
  INDEX `nhanvien_id_loai_idx` (`ID_LoaiNV` ASC) VISIBLE,
  CONSTRAINT `nhanvien_id_loai`
    FOREIGN KEY (`ID_LoaiNV`)
    REFERENCES `kmin`.`LOAI_NHAN_VIEN` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`PHAN_CONG`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`PHAN_CONG` ;

CREATE TABLE IF NOT EXISTS `kmin`.`PHAN_CONG` (
  `ID_GiangVien` INT NOT NULL,
  `ID_KhoaHoc` INT NOT NULL,
  `ID_TroGiang` INT NULL,
  `Luong` INT NULL,
  `NgayPhanCong` DATETIME NOT NULL,
  PRIMARY KEY (`ID_GiangVien`, `ID_KhoaHoc`),
  INDEX `phancong_id_khoahoc_idx` (`ID_KhoaHoc` ASC) VISIBLE,
  CONSTRAINT `phancong_id_giangvien`
    FOREIGN KEY (`ID_GiangVien`)
    REFERENCES `kmin`.`NHAN_VIEN` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `phancong_id_khoahoc`
    FOREIGN KEY (`ID_KhoaHoc`)
    REFERENCES `kmin`.`KHOA_HOC` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`LOAI_TIN_TUC`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`LOAI_TIN_TUC` ;

CREATE TABLE IF NOT EXISTS `kmin`.`LOAI_TIN_TUC` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TenLoaiTin` NVARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`TIN_TUC`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`TIN_TUC` ;

CREATE TABLE IF NOT EXISTS `kmin`.`TIN_TUC` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_NguoiDang` INT NOT NULL,
  `TieuDe` NVARCHAR(45) NOT NULL,
  `TomTat` NVARCHAR(100) NOT NULL,
  `NoiDung` NVARCHAR(20000) NOT NULL,
  `HinhAnh` TEXT(200) NULL,
  `ID_LoaiTin` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `tintuc_id_nguoidang_idx` (`ID_NguoiDang` ASC) VISIBLE,
  INDEX `tintuc_id_loaitin_idx` (`ID_LoaiTin` ASC) VISIBLE,
  CONSTRAINT `tintuc_id_nguoidang`
    FOREIGN KEY (`ID_NguoiDang`)
    REFERENCES `kmin`.`NHAN_VIEN` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `tintuc_id_loaitin`
    FOREIGN KEY (`ID_LoaiTin`)
    REFERENCES `kmin`.`LOAI_TIN_TUC` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`LOAI_TAI_LIEU`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`LOAI_TAI_LIEU` ;

CREATE TABLE IF NOT EXISTS `kmin`.`LOAI_TAI_LIEU` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TenLoaiTaiLieu` NVARCHAR(10) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`TAI_LIEU`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`TAI_LIEU` ;

CREATE TABLE IF NOT EXISTS `kmin`.`TAI_LIEU` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_NguoiDang` INT NOT NULL,
  `ID_ChuyenNganh` INT NOT NULL,
  `ID_Loai` INT NOT NULL,
  `TieuDe` NVARCHAR(45) NOT NULL,
  `MoTa` NVARCHAR(100) NULL,
  `Link` TEXT(200) NOT NULL,
  `NgayDang` DATETIME NOT NULL,
  `Avata` TEXT(100) NULL,
  PRIMARY KEY (`ID`),
  INDEX `tailieu_id_nguoidang_idx` (`ID_NguoiDang` ASC) VISIBLE,
  INDEX `tailieu_id_chuyennganh_idx` (`ID_ChuyenNganh` ASC) VISIBLE,
  INDEX `tailieu_id_loai_idx` (`ID_Loai` ASC) VISIBLE,
  CONSTRAINT `tailieu_id_nguoidang`
    FOREIGN KEY (`ID_NguoiDang`)
    REFERENCES `kmin`.`NHAN_VIEN` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `tailieu_id_chuyennganh`
    FOREIGN KEY (`ID_ChuyenNganh`)
    REFERENCES `kmin`.`CHUYEN_NGANH` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `tailieu_id_loai`
    FOREIGN KEY (`ID_Loai`)
    REFERENCES `kmin`.`LOAI_TAI_LIEU` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`NGUOI_TA_NOI`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`NGUOI_TA_NOI` ;

CREATE TABLE IF NOT EXISTS `kmin`.`NGUOI_TA_NOI` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Ten` NVARCHAR(60) NOT NULL,
  `Avata` TEXT(100) NOT NULL,
  `NoiDung` NVARCHAR(1000) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`DANG_KY_FREECOURSE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`DANG_KY_FREECOURSE` ;

CREATE TABLE IF NOT EXISTS `kmin`.`DANG_KY_FREECOURSE` (
  `ID_HocVien` INT NOT NULL,
  `ID_FreeCourse` INT NOT NULL,
  `NgayDangKy` DATETIME NOT NULL,
  PRIMARY KEY (`ID_HocVien`, `ID_FreeCourse`),
  INDEX `dangkyfree_id_freecourse_idx` (`ID_FreeCourse` ASC) VISIBLE,
  CONSTRAINT `dangkyfree_id_hocvien`
    FOREIGN KEY (`ID_HocVien`)
    REFERENCES `kmin`.`HOC_VIEN` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `dangkyfree_id_freecourse`
    FOREIGN KEY (`ID_FreeCourse`)
    REFERENCES `kmin`.`FREE_COURSE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`MA_GIAM_GIA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`MA_GIAM_GIA` ;

CREATE TABLE IF NOT EXISTS `kmin`.`MA_GIAM_GIA` (
  `ID` INT NOT NULL,
  `Value` TINYINT NOT NULL,
  `ID_NguoiTao` INT NOT NULL,
  `MoTa` NVARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `magiamgia_id_nguoitao_idx` (`ID_NguoiTao` ASC) VISIBLE,
  CONSTRAINT `magiamgia_id_nguoitao`
    FOREIGN KEY (`ID_NguoiTao`)
    REFERENCES `kmin`.`NHAN_VIEN` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`LOAI_UPDATE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`LOAI_UPDATE` ;

CREATE TABLE IF NOT EXISTS `kmin`.`LOAI_UPDATE` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TenLoaUpdate` NVARCHAR(30) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kmin`.`LICH_SU`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `kmin`.`LICH_SU` ;

CREATE TABLE IF NOT EXISTS `kmin`.`LICH_SU` (
  `ID_LoaiUpdate` INT NOT NULL,
  `ID_NguoiUpdate` INT NOT NULL,
  `ThoiGianUpdate` DATETIME NOT NULL,
  `MoTa` NVARCHAR(100) NULL,
  PRIMARY KEY (`ID_LoaiUpdate`, `ID_NguoiUpdate`, `ThoiGianUpdate`),
  INDEX `lichsu_id_nguoiupdate_idx` (`ID_NguoiUpdate` ASC) VISIBLE,
  CONSTRAINT `lichsu_id_loaiupdate`
    FOREIGN KEY (`ID_LoaiUpdate`)
    REFERENCES `kmin`.`LOAI_UPDATE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `lichsu_id_nguoiupdate`
    FOREIGN KEY (`ID_NguoiUpdate`)
    REFERENCES `kmin`.`NHAN_VIEN` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS admin;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'admin' IDENTIFIED BY 'admin';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `kmin`.`CHUYEN_NGANH`
-- -----------------------------------------------------
START TRANSACTION;
USE `kmin`;
INSERT INTO `kmin`.`CHUYEN_NGANH` (`ID`, `TenChuyenNganh`) VALUES (0, 'Luyện công');

COMMIT;


-- -----------------------------------------------------
-- Data for table `kmin`.`LOP_HOC`
-- -----------------------------------------------------
START TRANSACTION;
USE `kmin`;
INSERT INTO `kmin`.`LOP_HOC` (`ID`, `TenLop`, `ID_ChuyenNganh`, `HinhCover`, `YeuCauDauVao`, `GioiThieu`, `TomTat`, `DeCuong`, `MucTieu`, `ThoiLuong`) VALUES (0, 'Tư duy & kỹ năng lập trình', 0, NULL, 'hello', 'world', 'Tom tắt', 'Bài 1;Giới thiệu;Bài 2;', 'Đạt được', '12 buổi');

COMMIT;

