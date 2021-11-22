using ManageHR.Daos;
using ManageHR.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ManageHR.Controllers
{
    public class PolicyController : Controller
    {
        // GET: Policy
        PolicyDao policyDao = new PolicyDao();
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult Bonus(string mess)
        {
            var obj = policyDao.getListPolicies(1);
            ViewBag.mes = mess;
            return View(obj);
        }

        [HttpPost]
        public ActionResult AddBonus(Policy policy)
        {
            policy.id_category = 1;
            Policy check = policyDao.checkExist(policy);
            if (check == null)
            {
                policyDao.add(policy);
                return RedirectToAction("Bonus", new { mess = "1" });
            }
            else
            {
                return RedirectToAction("Bonus", new { mess = "2" });

            }
           
        }


        [HttpPost]
        public ActionResult DeleteBonus(Policy policy)
        {         
               policyDao.delete(policy.id_policy);
               return RedirectToAction("Bonus", new { mess = "1" });    
        }

        [HttpPost]
        public ActionResult EditBonus(Policy policy)
        {
            policy.id_category = 1;
            Policy check1 = policyDao.getPolicy(policy.id_policy);
           
            if (check1.name.Equals(policy.name))
            {
                policyDao.edit(policy);
                return RedirectToAction("Bonus", new { mess = "1" });
            }
            else
            {
                Policy check = policyDao.checkExist(policy);
                if (check == null)
                {
                    policyDao.edit(policy);
                    return RedirectToAction("Bonus", new { mess = "1" });
                }
                else
                {
                    return RedirectToAction("Bonus", new { mess = "2" });
                }
            }

        }

        public ActionResult Treatment(string mess)
        {
            var obj = policyDao.getListPolicies(2);
            ViewBag.mes = mess;
            return View(obj);
        }

        [HttpPost]
        public ActionResult AddTreatment(Policy policy)
        {
            policy.id_category = 2;
            Policy check = policyDao.checkExist(policy);
            if (check == null)
            {
                policyDao.add(policy);
                return RedirectToAction("Treatment", new { mess = "1" });
            }
            else
            {
                return RedirectToAction("Treatment", new { mess = "2" });

            }

        }

        [HttpPost]
        public ActionResult DeleteTreatment(Policy policy)
        {
            policyDao.delete(policy.id_policy);
            return RedirectToAction("Treatment", new { mess = "1" });
        }

        [HttpPost]
        public ActionResult EditTreatment(Policy policy)
        {
            policy.id_category = 2;
            Policy check1 = policyDao.getPolicy(policy.id_policy);

            if (check1.name.Equals(policy.name))
            {
                policyDao.edit(policy);
                return RedirectToAction("Treatment", new { mess = "1" });
            }
            else
            {
                Policy check = policyDao.checkExist(policy);
                if (check == null)
                {
                    policyDao.edit(policy);
                    return RedirectToAction("Treatment", new { mess = "1" });
                }
                else
                {
                    return RedirectToAction("Treatment", new { mess = "2" });
                }
            }

        }

        public ActionResult Discipline(string mess)
        {
            var obj = policyDao.getListPolicies(3);
            ViewBag.mes = mess;
            return View(obj);
        }

        [HttpPost]
        public ActionResult AddDiscipline(Policy policy)
        {
            policy.id_category = 3;
            Policy check = policyDao.checkExist(policy);
            if (check == null)
            {
                policyDao.add(policy);
                return RedirectToAction("Discipline", new { mess = "1" });
            }
            else
            {
                return RedirectToAction("Discipline", new { mess = "2" });

            }

        }

        [HttpPost]
        public ActionResult DeleteDiscipline(Policy policy)
        {
            policyDao.delete(policy.id_policy);
            return RedirectToAction("Discipline", new { mess = "1" });
        }

        [HttpPost]
        public ActionResult EditDiscipline(Policy policy)
        {
            policy.id_category = 3;
            Policy check1 = policyDao.getPolicy(policy.id_policy);

            if (check1.name.Equals(policy.name))
            {
                policyDao.edit(policy);
                return RedirectToAction("Discipline", new { mess = "1" });
            }
            else
            {
                Policy check = policyDao.checkExist(policy);
                if (check == null)
                {
                    policyDao.edit(policy);
                    return RedirectToAction("Discipline", new { mess = "1" });
                }
                else
                {
                    return RedirectToAction("Discipline", new { mess = "2" });
                }
            }
        }
    }
}