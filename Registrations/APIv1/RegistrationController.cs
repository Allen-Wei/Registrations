using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using Registrations.Models;

namespace Registrations.APIv1
{
    public class RegistrationController : ApiController
    {
        private RegistrationModel model = new RegistrationModel();

        public IEnumerable<Registration> Get(int take, int skip)
        {
            var total = model.Registrations.LongCount();
            var pages = Math.Ceiling((Convert.ToDouble(total) / Convert.ToDouble(take)));
            HttpContext.Current.Response.AddHeader("X-HeyHey-Total", total.ToString());
            HttpContext.Current.Response.AddHeader("X-HeyHey-Pages", pages.ToString());
            return model.Registrations.Skip(skip).Take(take).ToList();
        }

        public Registration Get(int id)
        {
            return model.Registrations.FirstOrDefault(r => r.Id == id);
        }
        public Registration Put( Registration registration)
        {
            model.Registrations.InsertOnSubmit(registration);
            model.SubmitChanges();
            return registration;
        } 
    }
}
