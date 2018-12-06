using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LoginRegistrationDemo.Models;

namespace LoginRegistrationDemo.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
       
        public ActionResult ComplainsDetails()
        {
            HMSEntities db = new HMSEntities();
            List<Complain> p = new List<Complain>();
            Complain o = new Complain();
            p = db.Complains.Where(x => x.AssignTo == "Admin").ToList();


            return View(p);
            
        }

      
     

    }
}