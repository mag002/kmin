package DB

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

type FreeCourse struct {
	ID               int
	Ten              string
	Link             string
	NgayTao          string
	DeCuong          string
	ID_ChuyenNganh   int
	DanhGiaTrungBinh int8
	LuotView         int64
}

func (fc *FreeCourse) GetData() {
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
		err = row.Scan(&fc.ID, &fc.Ten, &fc.Link, &fc.NgayTao, &fc.DeCuong, &fc.ID_ChuyenNganh, &fc.DanhGiaTrungBinh, &fc.LuotView)
		if err != nil {
			fmt.Println(err.Error())
		}
	}
}
