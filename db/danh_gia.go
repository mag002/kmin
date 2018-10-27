package DB

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

type DanhGia struct {
	ID_HocVien    int
	ID_FreeCourse int
	NgayTao       string
	NoiDung       string
	Sao           int8
}

func (dg *DanhGia) GetData() {
	db, err := sql.Open("mysql", "root:741789@tcp(127.0.0.1:3306)/kmin")
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	row, err := db.Query("select * from danh_gia")
	if err != nil {
		fmt.Println(err)
	}
	for row.Next() {
		err = row.Scan(&dg.ID_HocVien, &dg.ID_FreeCourse, &dg.NgayTao, &dg.NoiDung, &dg.Sao)
		if err != nil {
			fmt.Println(err.Error())
		}
	}
}
