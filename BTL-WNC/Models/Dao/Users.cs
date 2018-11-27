using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_WNC.Models;
using BTL_WNC.Models.Dao;
using System.Data.SqlClient;

namespace BTL_WNC.Models.Dao
{
    public class Users
    {
        Web_VietsozEntities db = null;
        public Users()
        {
            db = new Web_VietsozEntities();
        }

        public List<tblUser> ListAll()
        {
            return db.tblUsers.ToList();
        }

        public int CreateUserFc(string username, string password, string email, string role)
        {
            object[] param = {
                                 new SqlParameter("@username", username),
                                 new SqlParameter("@password", password),
                                 new SqlParameter("@email", email),
                                 new SqlParameter("@role", role)
                             };
            int res = db.Database.ExecuteSqlCommand("pr_insertUser @username, @password, @email, @role", param);
            return res;
        }

        public tblUser SelectUserById(int id)
        {
            return db.tblUsers.Find(id);
        }

        public bool EditUserById(tblUser objUser) {
            try
            {
                if (objUser != null)
                {
                    var user = db.tblUsers.Find(objUser.iId);
                    user.sUsername = objUser.sUsername;
                    user.sEmail = objUser.sEmail;
                    user.sRole = objUser.sRole;
                    db.SaveChanges();
                    return true;
                }
                return false;
            }
            catch
            {
                return false;
            }
        }

        public bool DeleteUser(int id)
        {
            try
            {
                var model = db.tblUsers.Find(id);
                db.tblUsers.Remove(model);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool ChangePassword(tblUser objUser)
        {
            try
            {
                var user = db.tblUsers.Find(objUser.iId);
                user.sPassword = objUser.sPassword;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    
    }
}