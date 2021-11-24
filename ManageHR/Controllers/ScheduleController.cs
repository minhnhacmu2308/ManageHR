using ManageHR.Daos;
using ManageHR.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ManageHR.Controllers
{
    public class ScheduleController : Controller
    {
        // GET: Schedule
        ScheduleDao scheduleDao = new ScheduleDao();
        UserDao userDao = new UserDao();
        public ActionResult Index(string msg)
        {
            ViewBag.List = scheduleDao.getSchedule();
            ViewBag.ListStaff = userDao.getListStaff();
            ViewBag.Msg = msg;
            return View();
        }
        [HttpPost]
        public ActionResult Add(FormCollection form)
        {
            Schedule schedule = new Schedule();
            schedule.id_user = Int32.Parse(form["nhanvien"]);
            schedule.date = DateTime.Parse(form["ngaycc"]);
            bool check = scheduleDao.check(Int32.Parse(form["nhanvien"]), DateTime.Parse(form["ngaycc"]));
            if (check)
            {
                scheduleDao.add(schedule);
                return RedirectToAction("Index", new { msg = "1" });
            }
            else
            {
                return RedirectToAction("Index", new { msg = "2" });
            }
        }
        [HttpPost]
        public ActionResult Update(FormCollection form)
        {
            Schedule schedule = new Schedule();
            schedule.id_user = Int32.Parse(form["nhanvien"]);
            schedule.date = DateTime.Parse(form["ngaycc"]);
            schedule.id_schedule = Int32.Parse(form["id"]);
            bool check = scheduleDao.check(Int32.Parse(form["nhanvien"]), DateTime.Parse(form["ngaycc"]));
            if (check)
            {
                scheduleDao.update(schedule);
                return RedirectToAction("Index", new { msg = "1" });
            }
            else
            {
                return RedirectToAction("Index", new { msg = "2" });
            }
        }
        public ActionResult Delete(FormCollection form)
        {
            var id = Int32.Parse(form["id"]);
            scheduleDao.delete(id);
            return RedirectToAction("Index", new { msg = "1" });
        }
    }
}