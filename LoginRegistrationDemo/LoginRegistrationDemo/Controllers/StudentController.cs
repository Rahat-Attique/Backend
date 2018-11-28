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

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddComplains(AddComplains cc)
        {
            using (HostelProjectEntities db = new HostelProjectEntities())
            {
                AddComplains comp = new AddComplains();
                comp.Subject = cc.Subject;
                comp.RoomNo = cc.RoomNo;
                comp.IssueType = cc.IssueType;
                comp.Priority = cc.Priority;
                comp.DueDate = cc.DueDate;
                comp.AssignComplainTo = cc.AssignComplainTo;
                comp.DueDate = cc.DueDate;
                comp.ComplainDetails = cc.ComplainDetails;
                //db.AddComplains.Add(comp);
                db.SaveChanges();
                ViewBag.SuccessMessage = "Successfully Added";



            }
            ViewBag.SuccessMessage = "not added";
            ModelState.Clear();
            return View("Added", new AddComplains());


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

    public class AddComplains
    {
        public object Subject { get; internal set; }
        public object RoomNo { get; internal set; }
        public object IssueType { get; internal set; }
        public object Priority { get; internal set; }
        public object DueDate { get; internal set; }
        public object AssignComplainTo { get; internal set; }
        public object ComplainDetails { get; internal set; }
    }
}