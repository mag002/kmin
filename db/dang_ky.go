package DB

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

type DangKy struct {
	ID_HocVien     int
	ID_KhoaHoc     int
	ThoiGianDangKy string
	ID_NhomTruong  int
	UuDai          string
	HinhThucHoc    int
	HocPhi         int64
	BuoiHoc        string
}

func (dk *DangKy) GetData() {
	db, err := sql.Open("mysql", "root:741789@tcp(127.0.0.1:3306)/kmin")
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	row, err := db.Query("select * from dang_ky")
	if err != nil {
		fmt.Println(err)
	}
	for row.Next() {
		err = row.Scan(&dk.ID_HocVien, &dk.ID_KhoaHoc, &dk.ThoiGianDangKy, &dk.ID_NhomTruong, &dk.UuDai, &dk.HinhThucHoc, &dk.HocPhi, &dk.BuoiHoc)
		if err != nil {
			fmt.Println(err.Error())
		}
	}
}
