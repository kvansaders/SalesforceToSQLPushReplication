using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SalesForce.OutboundMessages.Listeners.Models
{
    public class NotificationInput
    {
        /// <summary>
        /// The entity in which SF is sending the notification about. (ex: contact)
        /// </summary>
        public string NotificationType {get; set;}

        /// <summary>
        /// The row identifier for the notification record (ex: contact id xxx-xxxx )
        /// </summary>
        public string EntityRowId { get; set; }

        /// <summary>
        /// Date received by listener
        /// </summary>
        public DateTime RecievedDate { get; set; }


        /// <summary>
        /// Full string payload of JSON, converted from dictionary received.
        /// </summary>
        public string Payload { get; set; }
    }
}