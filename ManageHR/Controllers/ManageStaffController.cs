using ManageHR.Daos;
using ManageHR.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ManageHR.Controllers
{
    public class ManageStaffController : Controller
    {
        UserDao userDao = new UserDao();
        // GET: ManageStaff
        public ActionResult Index(string mess)
        {
            var obj = userDao.getListStaff();
            ViewBag.mes = mess;
            return View(obj);
        }

        [HttpPost]
        public ActionResult EditStaff(User user)
        {
            user.status = 1;
            userDao.edit(user);
            return RedirectToAction("Index", new { mess = "1" });
        }
    }
}