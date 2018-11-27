using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_WNC.Models.Dao
{
    public class MenuDao
    {
        Web_VietsozEntities db = null;
        public MenuDao() {
            db = new Web_VietsozEntities();
        }

        public List<tblCategory> ListAll()
        {
            var res = db.tblCategories.ToList();
            return res;
        }
    }
}