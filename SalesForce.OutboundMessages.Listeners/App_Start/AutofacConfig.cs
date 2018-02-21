using Autofac;
using Autofac.Integration.WebApi;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Http;
using SalesForce.OutboundMessages.Listeners.Repositories;
using NLog;
//using Autofac.Extras.NLog;

namespace SalesForce.OutboundMessages.Listeners.Config
{
    public static class AutofacConfig
    {
        public static void Register(HttpConfiguration config)
        {
            const string LoggerName = "SFOutboundMessageLogger";
            const string ApplicationName = "SFOutboundMessageListener";

            // create Ioc builder
            var builder = new ContainerBuilder();
            

            builder.RegisterApiControllers(Assembly.GetExecutingAssembly()).InstancePerRequest();

            builder.RegisterWebApiFilterProvider(GlobalConfiguration.Configuration);

            builder.RegisterType<NotificationRepository>().As<INotificationRepository>().SingleInstance();

            //builder.RegisterModule<NLogModule>();
            builder.Register(c=> new LogFactory().GetLogger(LoggerName)).AsImplementedInterfaces().SingleInstance();
            //builder.RegisterType<NLog.>().As<ILogger>().InstancePerLifetimeScope();

            var container = builder.Build();

            config.DependencyResolver = new AutofacWebApiDependencyResolver(container);

        }
    }
}