package main

import (
	"html/template"
	"net/http"

	D "./db"
)

var tpl *template.Template

func init() {
	tpl = template.Must(template.ParseGlob("template/*.html"))
}

func main() {
	// serve link
	http.HandleFunc("/", index)
	http.HandleFunc("/freecourse", freecourse)
	http.HandleFunc("/news", news)
	http.HandleFunc("/course", course)
	http.HandleFunc("/index", index)
	http.HandleFunc("/register", register)
	http.HandleFunc("/freecourse-detail", fcdetail)
	http.HandleFunc("/showroom", showroom)

	// serve folder
	http.Handle("/img/", http.StripPrefix("/img/", http.FileServer(http.Dir("template/img"))))
	http.Handle("/css/", http.StripPrefix("/css/", http.FileServer(http.Dir("template/css"))))
	http.Handle("/video/", http.StripPrefix("/video/", http.FileServer(http.Dir("template/video"))))
	http.Handle("/font/", http.StripPrefix("/font/", http.FileServer(http.Dir("template/font"))))
	http.Handle("/js/", http.StripPrefix("/js/", http.FileServer(http.Dir("template/js"))))

	http.ListenAndServe(":6060", nil)

}

func index(w http.ResponseWriter, r *http.Request) {
	err := tpl.ExecuteTemplate(w, "index.html", nil)
	if err != nil {

	}
}
func register(w http.ResponseWriter, r *http.Request) {
	err := tpl.ExecuteTemplate(w, "register.html", nil)
	if err != nil {

	}
}
func fcdetail(w http.ResponseWriter, r *http.Request) {
	var listFreecourseDetail []D.FreecourseDetail
	listFreecourseDetail = D.GetDataFreecourseDetail()
	err := tpl.ExecuteTemplate(w, "freecourse_detail.html", listFreecourseDetail)
	if err != nil {

	}
}

func news(w http.ResponseWriter, r *http.Request) {

	err := tpl.ExecuteTemplate(w, "news.html", nil)
	if err != nil {

	}
}

func freecourse(w http.ResponseWriter, r *http.Request) {
	err := tpl.ExecuteTemplate(w, "freecourse.html", nil)
	if err != nil {

	}
}

func course(w http.ResponseWriter, r *http.Request) {
	err := tpl.ExecuteTemplate(w, "course.html", nil)
	if err != nil {

	}
}

func showroom(w http.ResponseWriter, r *http.Request) {

	var listProject []D.Project
	listProject = D.GetDataProject()

	err := tpl.ExecuteTemplate(w, "showroom.html", listProject)
	if err != nil {

	}
}
