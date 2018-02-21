using Microsoft.AspNet.WebHooks;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using NLog;
using SalesForce.OutboundMessages.Listeners.Repositories;

namespace SalesForce.OutboundMessages.Listeners.Handlers
{
    public class SalesforceHandler : WebHookHandler
    {
        public override Task ExecuteAsync(string receiver, WebHookHandlerContext context)
        {

            var _logger = context.RequestContext.Configuration.DependencyResolver.GetService<ILogger>();
            
            SalesforceNotifications updates = context.GetDataOrDefault<SalesforceNotifications>();


            try
            {
                string sessionId = updates.SessionId;
                var notificationRepository = context.RequestContext.Configuration.DependencyResolver.GetService<INotificationRepository>();

                foreach(var notification in updates.Notifications)
                {

                    _logger.Log(LogLevel.Info, "Outbound message from SalesForce in Listener", "Insert", notification);
                    //Add message to SQL DB
                    Guid newId = notificationRepository.InsertMessage(notification) ;

                    if (newId == Guid.Empty)
                    {
                        throw new ArgumentOutOfRangeException("notification sessionId:" + sessionId + "\r\nFailure getting to DB.  No Guid was generated for notification payload \r\n" + JsonConvert.SerializeObject(notification) );
                    }

                }


                return Task.FromResult(true);
            }
            catch (Exception ex)
            {
                _logger.Log(LogLevel.Fatal, ex, "FATAL: Outbound message from Salesforce in Listener");
                return null;
            }

            


        }

}
}