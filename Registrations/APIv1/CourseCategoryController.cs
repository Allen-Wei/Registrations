using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Education.Models;

namespace Education.APIv1
{
    public class CourseCategoryController : ApiController
    {
        private EducationModel model = new EducationModel();
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
