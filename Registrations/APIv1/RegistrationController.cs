using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Registrations.Models;

namespace Registrations.APIv1
{
    public class RegistrationController : ApiController
    {
        private RegistrationModel model = new RegistrationModel();
        public Registration Put( Registration registration)
        {
            model.Registrations.InsertOnSubmit(registration);
            model.SubmitChanges();
            return registration;
        } 
    }
}
