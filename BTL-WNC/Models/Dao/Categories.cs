using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_WNC.Models.Dao;
using System.Data.SqlClient;

namespace BTL_WNC.Models.Dao
{
    public class Categories
    {
        Web_VietsozEntities db = null;
        public Categories()
        {
            db = new Web_VietsozEntities();
        }
        
        public List<tblCategory> ListAll()
        {
            return db.tblCategories.ToList();
        }

        public string CategoryById(long id)
        {
            var cate = db.tblCategories.Find(id);
            return cate.sName;
        }

        public tblNew PostCover(long id)
        {
            var res = db.Database.SqlQuery<tblNew>("select * from tblNews where bStatus = 1 and iCategoryId = " + id).Last();
            return res;
        }

        public int CreatecategoryFc(string name, string link)
        {
            object[] param = {
                                 new SqlParameter("@name", name),
                                 new SqlParameter("@link", link)
                             };
            int res = db.Database.ExecuteSqlCommand("pr_insertCategory @name, @link", param);
            return res;
        }

        public bool DeleteCategory(int id)
        {
            try
            {
                var model = db.tblCategories.Find(id);
                db.tblCategories.Remove(model);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}