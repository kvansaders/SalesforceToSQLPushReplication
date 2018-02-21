using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SalesForce.OutboundMessages.Listeners.Handlers;
using NLog;

namespace SalesForce.OutboundMessages.Listeners.Controllers
{
    public class NotificationsController : ApiController
    {
        public NotificationsController(ILogger logger)
        {
            if (logger == null)
            {
                throw new ArgumentNullException("logger", "Must pass instance of ILogger");
            }
            _logger = logger;
        }
        private ILogger _logger;

        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        [Route("webhooks/incoming/sfsoap")]
        public void Post([FromBody]string value)
        {
            
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}