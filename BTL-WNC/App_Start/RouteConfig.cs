using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace BTL_WNC
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //Backend
            routes.MapRoute(
                name: "Login",
                url: "login",
                defaults: new { controller = "Login", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "news",
                url: "news",
                defaults: new { controller = "Backend", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Create New",
                url: "news/add",
                defaults: new { controller = "Backend", action = "CreateNew", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "categories",
                url: "categories",
                defaults: new { controller = "Backend", action = "Categories", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Create category",
                url: "categories/add",
                defaults: new { controller = "Backend", action = "CreateCategory", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "users",
                url: "users",
                defaults: new { controller = "Backend", action = "Users", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Create user",
                url: "users/add",
                defaults: new { controller = "Backend", action = "CreateUser", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Edit user",
                url: "users/edit-{id}",
                defaults: new { controller = "Backend", action = "SelectUserById", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Delete user",
                url: "users/delete",
                defaults: new { controller = "Backend", action = "DeleteUser", id = UrlParameter.Optional }
            );


            //Frontend
            routes.MapRoute(
                name: "Danh muc",
                url: "{metatitle}-{id}",
                defaults: new { controller = "Frontend", action = "Categories", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Chi Tiet",
                url: "Frontend/detail-{id}",
                defaults: new { controller = "Frontend", action = "Details", id = UrlParameter.Optional }
            );


            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Frontend", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
