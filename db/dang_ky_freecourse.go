package DB

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

type DangKyFreeCourse struct {
	ID_HocVien    int
	ID_FreeCourse int
	NgayDangKy    string
}

func (dkf *DangKyFreeCourse) GetData() {
	db, err := sql.Open("mysql", "root:741789@tcp(127.0.0.1:3306)/kmin")
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	row, err := db.Query("select * from dang_ky_freecourse")
	if err != nil {
		fmt.Println(err)
	}
	for row.Next() {
		err = row.Scan(&dkf.ID_HocVien, &dkf.ID_FreeCourse, &dkf.NgayDangKy)
		if err != nil {
			fmt.Println(err.Error())
		}
	}
}
