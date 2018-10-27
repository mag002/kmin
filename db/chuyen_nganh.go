package DB

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

type ChuyenNganh struct {
	ID  int
	Ten string
}

func (cn *ChuyenNganh) GetData() {
	db, err := sql.Open("mysql", "root:741789@tcp(127.0.0.1:3306)/kmin")
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()

	row, err := db.Query("select * from chuyen_nganh")
	if err != nil {
		fmt.Println(err)
	}
	for row.Next() {
		err = row.Scan(&cn.ID, &cn.Ten)
		if err != nil {
			fmt.Println(err.Error())
		}
	}
}
