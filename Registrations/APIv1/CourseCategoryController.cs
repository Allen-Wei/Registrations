using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Registrations.Models;

namespace Registrations.APIv1
{
    public class CourseCategoryController : ApiController
    {
        private RegistrationModel model = new RegistrationModel();
        public IEnumerable<CourseCategory> Get()
        {
            return model.CourseCategories;
        }
        public CourseCategory Get(string id)
        {
            return model.CourseCategories.FirstOrDefault(cc => cc.Name == id);
        }
    }
}
