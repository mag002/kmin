package DB

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

type FreecourseDetail struct {
	ID               int
	TenKhoa          string
	GioiThieu        string
	Link             string
	ID_NhanVien      int
	NgayTao          string
	DeCuong          string
	ID_ChuyenNganh   int
	DanhGiaTrungBinh float64
	LuotView         int
}

// func (fcd *Project) GetData() {
// 	db, err := sql.Open("mysql", "root:741789@tcp(127.0.0.1:3306)/kmin")
// 	if err != nil {
// 		panic(err.Error())
// 	}
// 	defer db.Close()

// 	row, err := db.Query("select * from project")
// 	if err != nil {
// 		fmt.Println(err)
// 	}
// 	for row.Next() {
// 		err = row.Scan(&fcd.ID, &fcd.IDLop, &fcd.IDTacGia, &fcd.Ten, &fcd.Link, &fcd.NgayTao, &fcd.LuotView)
// 		fmt.Print(fcd.ID)
// 		if err != nil {
// 			fmt.Println(err.Error())
// 		}
// 	}
// }
func GetDataFreecourseDetail() []FreecourseDetail {
	var listFreecourseDetail []FreecourseDetail
	var fcd FreecourseDetail
	db, err := sql.Open("mysql", "root:741789@tcp(127.0.0.1:3306)/kmin")
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	row, err := db.Query("select * from free_course")
	if err != nil {
		fmt.Println(err)
	}
	for row.Next() {
		err = row.Scan(&fcd.ID, &fcd.TenKhoa, &fcd.GioiThieu, &fcd.Link, &fcd.ID_NhanVien, &fcd.NgayTao, &fcd.DeCuong, &fcd.ID_ChuyenNganh, &fcd.DanhGiaTrungBinh, &fcd.LuotView)

		listFreecourseDetail = append(listFreecourseDetail, fcd)
		if err != nil {
			fmt.Println(err.Error())
		}
	}

	return listFreecourseDetail
}
