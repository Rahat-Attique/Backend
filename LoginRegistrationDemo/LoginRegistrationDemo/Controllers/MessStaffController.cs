
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
        //HostelProjectEntities db = new HostelProjectEntities();
        //public List<User> users { get; set; }
        //public List<ApprovedStudent> approvedStudents { get; set; }


        public ActionResult MessComplainsDetails()
        {
            HMSEntities db = new HMSEntities();
            List<Complain> p = new List<Complain>();
            Complain o = new Complain();
            p = db.Complains.Where(x => x.AssignTo == "MessStaff").ToList();


            return View(p);

        }

        public ActionResult Dinner()
        {


            return View();
        }

        public ActionResult expenses()
        {


            return View();
        }

        //public ActionResult approvedrequest(ApprovedStudent j)
        //{

        //    db.ApprovedStudents.Add(j);

        //    db.SaveChanges();
        //    //return RedirectToAction("Index", new { id = 0 });
        //    return View(db.ApprovedStudents.ToList());
        //}
        //public ActionResult newrequests(User users)
        //{

        //    //return View(new User());
        //    db.Users.Add(users);

        //    return View(db.Users.ToList());
        //}
        //public ActionResult practice(int ID)
        //{
        //    var temps = db.Users.Where(t => t.ID == ID).ToList();
        //    ApprovedStudent k = new ApprovedStudent();
        //    User obj = db.Users.Find(ID);
        //    k.Username = obj.Username;
        //    k.Email = obj.Email;
        //    k.CNIC = obj.CNIC;
        //    k.Degree = obj.Degree;
        //    k.Department = obj.Department;
        //    k.HostelName = obj.HostelName;
        //    k.RoomNumber = obj.RoomNumber;
        //    k.phoneNumber = obj.PhoneNumber;
        // //   k.IsValid = obj.IsValid(o)

        //    k.RegistrationNumber = obj.RegistrationNumber;
           
        //    db.ApprovedStudents.Add(k);
        //    db.SaveChanges();
        //    return RedirectToAction("newrequests", new { id = 0 });
        //   // return View(db.ApprovedStudents.ToList());

        //}


        public ActionResult lunch()
        {


            return View();
        }
    }
}