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
        ScheduleDao scheduleDao = new ScheduleDao();
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

        [HttpPost]
        public ActionResult AddStaff(User user)
        {
            User checkUsername = userDao.checkExistName(user.username);
            User checkEmail = userDao.getInformationByUserName(user.email);
            if(checkEmail != null)
            {
                return RedirectToAction("Index", new { mess = "2" });
            }
            else if (checkUsername != null)
            {
                return RedirectToAction("Index", new { mess = "3" });
            }
            else
            {
                userDao.add(user);
                return RedirectToAction("Index", new { mess = "1" });
            }
           
        }

        [HttpPost]
        public ActionResult DeleteStaff(User user)
        {
            var listSchedule = scheduleDao.getListScheduleByIdUser(user.id_user);
            if (listSchedule.Count != 0)
            {
                return RedirectToAction("Index", new { mess = "4" });
            }
            else
            {
                userDao.delete(user.id_user);
                return RedirectToAction("Index", new { mess = "1" });
            }
        }
    }
}