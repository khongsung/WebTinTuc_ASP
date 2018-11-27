using BTL_WNC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL_WNC.Controllers.Login
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(BTL_WNC.Models.tblUser usermodle)
        {
            using (Web_VietsozEntities db = new Web_VietsozEntities())
            {
                var userdetail = db.tblUsers.Where(x => x.sEmail == usermodle.sEmail && x.sPassword == usermodle.sPassword).FirstOrDefault();
                if (userdetail == null)
                {
                    return View("Index", usermodle);
                }
                else
                {
                    if (ModelState.IsValid)
                    {
                        
                    }
                    Session["userID"] = userdetail.iId;
                    Session["userName"] = userdetail.sUsername;
                    return RedirectToAction("Index", "Backend");
                }
            }
        }

        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Login");
        }
	}
}