using System.Web;
using System.Web.Mvc;

namespace SalesForce.OutboundMessages.Listeners
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
