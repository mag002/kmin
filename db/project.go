package DB

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

type Project struct {
	ID       int
	IDLop    int
	IDTacGia int
	Ten      string
	Link     string
	NgayTao  string
	LuotView int64
}

// func (pj *Project) GetData() {
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
// 		err = row.Scan(&pj.ID, &pj.IDLop, &pj.IDTacGia, &pj.Ten, &pj.Link, &pj.NgayTao, &pj.LuotView)
// 		fmt.Print(pj.ID)
// 		if err != nil {
// 			fmt.Println(err.Error())
// 		}
// 	}
// }
func GetDataProject() []Project {
	var listProject []Project
	var pj Project
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
		err = row.Scan(&pj.ID, &pj.IDLop, &pj.IDTacGia, &pj.Ten, &pj.Link, &pj.NgayTao, &pj.LuotView)

		listProject = append(listProject, pj)
		if err != nil {
			fmt.Println(err.Error())
		}
	}

	return listProject
}
