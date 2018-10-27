package DB

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

type FreecourseDetail2 struct {
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

func (fcd *FreecourseDetail2) GetDataFC() {
	db, err := sql.Open("mysql", "root:741789@tcp(127.0.0.1:3306)/kmin")
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	row, err := db.Query("select * from project")
	if err != nil {
		fmt.Println(err)
	}
	for row.Next() {
		err = row.Scan(&fcd.ID, &fcd.TenKhoa, &fcd.GioiThieu, &fcd.Link, &fcd.ID_NhanVien, &fcd.NgayTao, &fcd.DeCuong, &fcd.ID_ChuyenNganh, &fcd.DanhGiaTrungBinh, &fcd.LuotView)
		fmt.Print(fcd.ID)
		if err != nil {
			fmt.Println(err.Error())
		}
	}
}

type DanhGia2 struct {
	ID_HocVien    int
	ID_FreeCourse int
	NgayTaoDG     string
	NoiDung       string
	Sao           int8
}

func (dg *DanhGia2) GetDataCMT() {
	db, err := sql.Open("mysql", "root:741789@tcp(127.0.0.1:3306)/kmin")
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	row, err := db.Query("select * from danh_gia where ID_FreeCourse=4")
	if err != nil {
		fmt.Println(err)
	}
	for row.Next() {
		err = row.Scan(&dg.ID_HocVien, &dg.ID_FreeCourse, &dg.NgayTaoDG, &dg.NoiDung, &dg.Sao)
		if err != nil {
			fmt.Println(err.Error())
		}
	}
}

type Combinded2 struct {
	FreecourseDetail2
	DanhGia2
}

func (cb *Combinded2) GetCombinded() {
	var listcmt DanhGia2
	listcmt.GetDataCMT()
	var listfc FreecourseDetail2
	listfc.GetDataFC()

	dt := Combinded2{
		FreecourseDetail2: listfc,
		DanhGia2:          listcmt,
	}
	fmt.Println(dt)

}
