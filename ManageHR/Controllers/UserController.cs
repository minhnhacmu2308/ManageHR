using ManageHR.Daos;
using ManageHR.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ManageHR.Controllers
{
    public class UserController : Controller
    {
        UserDao userDao = new UserDao();
        ScheduleDao scheduleDao = new ScheduleDao();
        // GET: User
        public ActionResult Index(string mess)
        {
            var user = (User)Session["USER"];
            var obj = userDao.getInformationByUserName(user.email);
            ViewBag.list = obj;
            ViewBag.mes = mess;
            return View();
        }

        public ActionResult Edit(string mess)
        {
            User user = (User)Session["USER"];
            if (user == null)
            {
                return RedirectToAction("Login", "Authentication");
            }
            else
            {
                var list = userDao.getInformationByUserName(user.email);
                ViewBag.list = list;
                ViewBag.mes = mess;
                return View();
            }
        }

        [HttpPost]
        public ActionResult EditPost(User user)
        {
            user.status = 1;
            userDao.edit(user);
            return RedirectToAction("Edit", new { mess = "1" });
        }

        public ActionResult Schedule()
        {
            User user = (User)Session["USER"];
            var obj = scheduleDao.getListScheduleByIdUser(user.id_user);
            return View(obj);
        }

        public ActionResult DetailStaff(int id)
        {
            var obj = userDao.getUserById(id);
            ViewBag.list = obj;
            return View();
        }
    }
}