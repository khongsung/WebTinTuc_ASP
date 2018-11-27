using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_WNC.Models.Dao
{
    public class News
    {
        Web_VietsozEntities db = null;
        public News()
        {
            db = new Web_VietsozEntities();
        }

        public List<tblNew> ListAll()
        {
            return db.tblNews.ToList();
        }

        public List<tblNew> ListByCategory(long id)
        {
            return db.tblNews.Where(x => x.iCategoryId == id && x.bStatus == true).ToList();
        }

        public tblNew Detail(long id)
        {
            return db.tblNews.Find(id);
        }

        public List<tblNew> Sidebar()
        {
            return db.tblNews.Where(x => x.iId > 0 && x.iId < 7 && x.bStatus == true).ToList();
        }

        public List<tblNew> PostListIndex(long id)
        {
            var res = db.Database.SqlQuery<tblNew>("select top 2 * from tblNews where iCategoryId = " + id).ToList();
            return res;
        }

        public bool DeleteNews(int id)
        {
            try
            {
                var model = db.tblNews.Find(id);
                db.tblNews.Remove(model);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool NewsChangeStatus(int id)
        {
            var model = db.tblNews.Find(id);
            model.bStatus = !model.bStatus;
            db.SaveChanges();
            return (bool)model.bStatus;
        }
    }
}