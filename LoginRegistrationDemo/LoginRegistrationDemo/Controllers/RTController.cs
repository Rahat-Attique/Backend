using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LoginRegistrationDemo.Models;

namespace LoginRegistrationDemo.Controllers
{
    public class RTController : Controller
    {
        // GET: RT
        public ActionResult RTComplainsDetails()
        {
            HMSEntities db = new HMSEntities();
            List<Complain> p = new List<Complain>();
            Complain o = new Complain();
            p = db.Complains.Where(x => x.AssignTo == "RT").ToList();


            return View(p);

        }

        public ActionResult Menu()
        {
            return View();
        }

        public ActionResult OneDayMenu()
        {
            return View();
        }

        public ActionResult Requests()
        {
            return View();
        }
    }
}