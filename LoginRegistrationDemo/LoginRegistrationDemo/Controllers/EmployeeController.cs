using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LoginRegistrationDemo.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        public ActionResult ViewDetails()
        {
            return View();
        }
        public ActionResult AddComplains()
        {
            return View();
        }
    }
}