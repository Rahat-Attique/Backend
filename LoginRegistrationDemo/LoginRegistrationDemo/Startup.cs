using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LoginRegistrationDemo.Startup))]
namespace LoginRegistrationDemo
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
