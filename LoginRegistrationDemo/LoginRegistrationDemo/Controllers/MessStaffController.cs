
using System;
using System.Collections.Generic;
using LoginRegistrationDemo.Models;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace LoginRegistrationDemo.Controllers
{
    public class MessStaffController : Controller
    {
        // GET: MessStaff
        HostelProjectEntities db = new HostelProjectEntities();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Dinner()
        {


            return View();
        }

        public ActionResult expenses()
        {


            return View();
        }
        public ActionResult approvedrequest(ApprovedStudent stu)
        {


            return View(db.ApprovedStudents.ToList());
        }
        public ActionResult newrequests(User users)
        {

            //return View(new User());
            return View(db.Users.ToList());
        }
        public ActionResult lunch()
        {


            return View();
        }
    }
}