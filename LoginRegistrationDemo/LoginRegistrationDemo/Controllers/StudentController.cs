using System;
using System.Collections.Generic;
using LoginRegistrationDemo.Models;

using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LoginRegistrationDemo.Controllers
{
    public class StudentController : Controller
    {
        // GET: Student
        HostelProjectEntities db = new HostelProjectEntities();
        public List<User> users { get; set; }
        public List<ApprovedStudent> approvedStudents { get; set; }
        // [HttpPost]
        public ActionResult Index()
        {
            return View();

        }

        public ActionResult AddComplains()
        {
            return View();
        }

        public ActionResult ViewDetails()
        {
            return View();
        }

        public ActionResult Calender()
        {
            return View();
        }
        public ActionResult ViewDetails(int ID)
        {

            var temps = db.Users.Where(t => t.ID == ID).ToList();
          //  ApprovedStudent k = new ApprovedStudent();
            User obj = db.Users.Find(ID);

            return View();
        }
    }
}