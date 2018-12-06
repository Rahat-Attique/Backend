using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LoginRegistrationDemo.Models;

using System.Data.Entity.Validation;
using System.Web.ClientServices;
using System.Web.Security;

namespace LoginRegistrationDemo.Controllers
{
    public class RegisterController : Controller
    {
        // GET: Register
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult StuRegister()
        {
            HMSEntities db = new HMSEntities();
            List<Department> departments = db.Departments.ToList();
            ViewBag.DepartmentList = new SelectList(departments, "DepartmentID", "Name");

            return View();
        }

        [HttpPost]
        public ActionResult StuRegister(Student obj)
        {
            try
            {
                HMSEntities db = new HMSEntities();
                List<Department> list = db.Departments.ToList();
                ViewBag.DepartmentList = new SelectList(list, "DepartmentID", "Name");
                Student k = new Student();
                Login site = new Login();
                site.Email = obj.Email;
                site.Password = obj.password;
                site.Type = "stu";
                // using (HMSEntities k =new HMSEntities())
                if (db.Logins.Any(x => x.Email == obj.Email))
                {  //{
                    ViewBag.Message = "EEEE";
                    //    ViewBag.Message = "UserName or password is wrong";
                    //   // return View("StuRegister",)
                    return RedirectToAction("Login");
                    //    ViewBag.ErrorMessage = "Email not found or matched";
                    //return View();
                }
                else
                {
                    db.Logins.Add(site);
                    db.SaveChanges();

                    k.Name = obj.Email;
                    k.password = obj.password;
                    k.DOB = obj.DOB;
                    k.DepartmentID = obj.DepartmentID;
                    k.PhoneNumber = obj.PhoneNumber;
                    k.RegistrationNumber = obj.RegistrationNumber;




                    int latestid = site.LoginID;

                    k.LoginID = site.LoginID;


                    k.Address = obj.Address;
                  //  k.DOB = obj.Address;
                    k.Session = obj.Session;

                //    k.Designation = obj.Designation;


                    //  k.Login.LoginID = obj.LoginID;
                    //k.StudentID = latestid;



                    db.Students.Add(k);
                    db.SaveChanges();

                    ////  int lateststuID = k.StudentID;

                }


            }
            catch (DbEntityValidationException e)
            {


                Console.WriteLine(e.ToString());

            }


            return View(obj);
        }

        public ActionResult EmpRegister()
        {


            return View();
        }
        [HttpPost]
        public ActionResult EmpRegister(Employee obj)
        {
            try
            {
                HMSEntities db = new HMSEntities();

                Employee k = new Employee();
                Login site = new Login();
                site.Email = obj.Name;
                site.Password = obj.password;
                site.Type = "emp";
                // using (HMSEntities k =new HMSEntities())
                if (db.Logins.Any(x => x.Email == obj.Name))
                {  //{
                    ViewBag.Message = "EEEE";
                    //    ViewBag.Message = "UserName or password is wrong";
                    //   // return View("StuRegister",)
                    return RedirectToAction("Login");
                    //    ViewBag.ErrorMessage = "Email not found or matched";
                    //return View();
                }
                else
                {
                    db.Logins.Add(site);
                    db.SaveChanges();

                    k.Name = obj.Name;
                    k.password = obj.password;
                    k.DOB = obj.DOB;




                    int latestid = site.LoginID;

                    k.LoginID = site.LoginID;


                    k.Cell = obj.Cell;
                    k.Address = obj.Address;
                    k.CNIC = obj.CNIC;

                    k.Designation = obj.Designation;


                    //  k.Login.LoginID = obj.LoginID;
                    //k.StudentID = latestid;



                    db.Employees.Add(k);
                    db.SaveChanges();

                    ////  int lateststuID = k.StudentID;

                }


            }
            catch (DbEntityValidationException e)
            {


                Console.WriteLine(e.ToString());

            }


            return View(obj);
        }


        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Login l)

        {
            if (l.Email == "Admin" && l.Password == "A123")
            {
                return RedirectToAction("Index", "Admin");
            }
            else if (l.Email == "RT" && l.Password == "R123")
            {
                return RedirectToAction("Index", "RT");
            }
            else if (l.Email == "Mess" && l.Password == "M123")
            {
                return RedirectToAction("Index", "MessStaff");
            }
            else {
                using (HMSEntities db = new HMSEntities())
                {
                    var v = db.Logins.Where(x => x.Email == l.Email && x.Password == l.Password).FirstOrDefault();
                    if (v != null)

                    {
                        var k = db.Students.Where(d => d.Login.Type == v.Type).FirstOrDefault();
                        if (k != null)
                        {
                            return RedirectToAction("SViewDetails", "Student");
                        }
                        else if (k == null)
                        {
                            return RedirectToAction("ViewDetails", "Employee");
                        }
                        else
                        {
                            ModelState.AddModelError("", "invalid user");
                        }
                    }

                }
            }
            return View();
        }
               
            }
               
        }
    
