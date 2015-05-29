using System.Web.Mvc;

namespace MvcMeublatexApp.Areas.Photos
{
    public class PhotosAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Photos";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "photos_default",
                "{culture}/photos/{controller}/{action}/{id}",
                new { culture = "en-IE", controller = "PhotosHome", action = "Index", id = "" },
                new { culture = "^[a-zA-Z]{2,2}-[a-zA-Z]{2,2}$" }
            );
        }
    }
}
