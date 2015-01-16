using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.UI;
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
        public Registration Put(Registration registration)
        {
            model.Registrations.InsertOnSubmit(registration);
            model.SubmitChanges();
            return registration;
        }

        public Registration Post(Registration registration)
        {
            var reg = model.Registrations.FirstOrDefault(r => r.Id == registration.Id);
            if (reg == null) { return null; }
            reg.RegistrateDate = registration.RegistrateDate;
            reg.StudentName = registration.StudentName;
            reg.Gender = registration.Gender;
            reg.Phone = registration.Phone;
            reg.Price = registration.Price;
            reg.CourseType = registration.CourseType;
            reg.RegistrationAddress = registration.RegistrationAddress;
            reg.HomeAddress = registration.HomeAddress;
            reg.Payee = registration.Payee;
            reg.CurrentGrade = registration.CurrentGrade;
            reg.CurrentCollege = registration.CurrentCollege;
            reg.RegistrateCollege = registration.RegistrateCollege;
            reg.EducationDegree = registration.EducationDegree;
            reg.Note = registration.Note;
            model.SubmitChanges();
            return reg;
        }

        public bool Delete(int id)
        {

            var reg = model.Registrations.FirstOrDefault(r => r.Id == id);
            if (reg == null) { return false; }
            model.Registrations.DeleteOnSubmit(reg);
            model.SubmitChanges();
            return true;
        }
    }
}
