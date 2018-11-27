using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_WNC.Models.Dao;
using BTL_WNC.Models;
using PagedList;
using System.Data.SqlClient;
using Newtonsoft.Json;

namespace BTL_WNC.Controllers.Backend
{
    public class BackendController : Controller
    {

        //
        // GET: /Backend/
        public ActionResult Index(int? page)
        {
            if (Session["userID"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {
                int pageSize = 5;
                int pageNumber = (page ?? 1);
                var model = new News().ListAll();
                return View(model.ToPagedList(pageNumber, pageSize));
            }
            
        }

        public ActionResult Categories(int? page)
        {
            if (Session["userID"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {
                int pageSize = 5;
                int pageNumber = (page ?? 1);
                var model = new Categories().ListAll();
                return View(model.ToPagedList(pageNumber, pageSize));
            }
        }

        public ActionResult Users(int? page)
        {
            if (Session["userID"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {
                int pageSize = 5;
                int pageNumber = (page ?? 1);
                var model = new Users().ListAll();
                return View(model.ToPagedList(pageNumber,pageSize));
            }
        }

        public ActionResult CreateNew()
        {
            return View();
        }

        [HttpPost]
        public JsonResult DeleteNews(int id)
        {
            var model = new News().DeleteNews(id);
            return Json(new
            {
                status = model
            });
        }

        [HttpPost]
        public JsonResult NewsChangeStatus(int id)
        {
            var model = new News().NewsChangeStatus(id);
            return Json(new { status = model });
        }

        public ActionResult CreateCategory()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateCategory(tblCategory tblCategory)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var model = new Categories().CreatecategoryFc(tblCategory.sName, tblCategory.link);
                    if (model > 0)
                    {
                        return RedirectToAction("categories", "Backend");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Thêm k thành công");
                    }
                    
                }
                return View(tblCategory);
            }
            catch
            {
                return View();
            }
            
        }

        [HttpDelete]
        public ActionResult DeleteCategory(int id)
        {
            new Categories().DeleteCategory(id);
            return RedirectToAction("Categories");
        }

        public ActionResult CreateUser()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateUser(tblUser model)
        {
            if (ModelState.IsValid)
            {
                var item = new Users().CreateUserFc(model.sUsername, model.sPassword, model.sEmail, model.sRole);
                if (item > 0)
                {
                    return RedirectToAction("Users", "Backend");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm k thành công");
                }
            }
            return View(model);
        }

        [HttpGet]
        public JsonResult SelectUserById(int id)
        {
            try
            {
                var model = new Users().SelectUserById(id);
                string value = string.Empty;
                value = JsonConvert.SerializeObject(model, Formatting.Indented, new JsonSerializerSettings { ReferenceLoopHandling = ReferenceLoopHandling.Ignore });
                return Json(value, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json(new { data = "" });
            }
        }

        [HttpPost]
        public JsonResult EditUserById(tblUser objUser)
        {
            try
            {
                var model = new Users().EditUserById(objUser);
                if (model == true)
                {
                    return Json(new { status = model });
                }
                else
                {
                    return Json(new { status = false });
                }
            }
            catch
            {
                return Json(new { status = false });
            }
        }

        [HttpPost]
        public JsonResult DeleteUser(int id)
        {
            var res = new Users().DeleteUser(id);
            return Json(new
            {
                status = res
            });
        }
	}
}