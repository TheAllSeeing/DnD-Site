using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DnDSite.Startup))]
namespace DnDSite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
