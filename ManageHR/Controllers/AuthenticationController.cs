using ManageHR.Daos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ManageHR.Controllers
{
    public class AuthenticationController : Controller
    {
        UserDao userDao = new UserDao();
        // GET: Authentication
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login() { return View(); }

        [HttpPost]
        public ActionResult Login(FormCollection form)
        {
            var email = form["email"];
            var password = form["password"];
            bool checkLogin = userDao.checkLogin(email, password);
            if (checkLogin)
            {
                var userInformation = userDao.getInformationByUserName(email);
                Session.Add("USER", userInformation);
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.mess = "Thông tin tài khoản hoặc mật khẩu không chính xác";
                return View("Login");
            }

        }
        public ActionResult Logout()
        {
            Session.Remove("USER");
            return Redirect("/");
        }

    }
}