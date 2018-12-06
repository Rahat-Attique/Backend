using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LoginRegistrationDemo.Models;
using System.Data.Entity.Validation;
namespace LoginRegistrationDemo.Controllers
{
    public class StudentController : Controller
    {
        // GET: Student
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult SViewDetails()
        {
            return View();
        }

        public ActionResult SAddComplains()
        {

            HMSEntities db = new HMSEntities();
            List<Status> status = db.Status.ToList();
            ViewBag.StatusList = new SelectList(status, "StatusID", "StatusName");



            return View();
        }

        public ActionResult SAddComplains(Complain obj)
        {
            try
            {
                HMSEntities db = new HMSEntities();
              //  List<Status> status = db.Status.ToList();
              //  ViewBag.StatusList = new SelectList(status, "StatusID", "StatusName");
                Complain c = new Complain();
                c.Subject = obj.Subject;
                c.AssignTo = obj.AssignTo;
                c.Details = obj.Details;
                c.Priority = obj.Priority;
                c.CreatedBy = obj.CreatedBy;
                c.CreationDate = obj.CreationDate;
                
                db.Complains.Add(c);
                db.SaveChanges();
            }

            catch (DbEntityValidationException e)
            {


                Console.WriteLine(e.ToString());

            }

            return View(obj);
        }
        public ActionResult AddComplains()
        {

            HMSEntities db = new HMSEntities();
            //List<Status> status = db.Status.ToList();
            //ViewBag.StatusList = new SelectList(status, "StatusID", "StatusName");



            return View();
        }
        [HttpPost]
        public ActionResult AddComplains(Complain obj)
        {
            try
            {
                HMSEntities db = new HMSEntities();
                //  List<Status> status = db.Status.ToList();
                //  ViewBag.StatusList = new SelectList(status, "StatusID", "StatusName");
                Complain c = new Complain();
                c.Subject = obj.Subject;
                c.AssignTo = obj.AssignTo;
                c.Details = obj.Details;
                c.Priority = obj.Priority;
                c.CreatedBy = obj.CreatedBy;
                c.CreationDate = obj.CreationDate;
                 
                db.Complains.Add(c);
                db.SaveChanges();
            }

            catch (DbEntityValidationException e)
            {


                Console.WriteLine(e.ToString());

            }

            return View(obj);
        }
    }
}