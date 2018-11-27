using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BTL_WNC.Startup))]
namespace BTL_WNC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
