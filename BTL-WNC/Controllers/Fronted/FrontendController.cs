using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_WNC.Models.Dao;

namespace BTL_WNC.Controllers.Fronted
{
    public class FrontendController : Controller
    {
        //
        // GET: /Frontend/
        public ActionResult Index()
        {
            var model = new MenuDao().ListAll();
            var postcover = new Categories().PostCover(1);//Posst cover top
            var listPostCoverTop = new News().ListByCategory(1);//post cover right top

            object[] postList = new object[10]; //post left
            object[] postListRight = new object[10]; //post right
            for (var i = 1; i < model.Count; i++)
            {
                var item = new Categories().PostCover(model[i].iId);
                postList[i] = item;

                var itemRight = new News().PostListIndex(model[i].iId);
                postListRight[i] = itemRight;
            }
            //var i = 0;
            //foreach (var recore in model)
            //{
            //    var item = new Categories().PostCover(recore.iId);
            //    postList[i] = item;

            //    var itemRight = new News().PostListIndex(recore.iId);
            //    postListRight[i] = itemRight;
            //    i++;
            //}
            ViewBag.PostCoverTop = postcover;
            ViewBag.ListPostCoverTop = listPostCoverTop;

            ViewBag.PostCoverList = postList;
            ViewBag.PostListRight = postListRight;
            return View(model);
        }

        public ActionResult Categories(long id)
        {
            var model = new News().ListByCategory(id);
            ViewBag.CategeoryName = new Categories().CategoryById(id);
            var item = new Categories().PostCover(id);
            ViewBag.PostCover = item;
            return View(model);
        }


        public ActionResult Details(long id)
        {
            var model = new News().Detail(id);
            return View(model);
        }

        [ChildActionOnly]
        public ActionResult PartialHeader()
        {
            var model = new MenuDao().ListAll();
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult PartialSidebar()
        {
            var model = new News().Sidebar();
            return PartialView(model);
        }
	}
}