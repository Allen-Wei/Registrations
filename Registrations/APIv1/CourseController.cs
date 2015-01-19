using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Registrations.Models;


namespace Registrations.APIv1
{
    public class CourseController : ApiController
    {
        private RegistrationModel model = new RegistrationModel();
        public IEnumerable<Course> GetCourses(string category)
        {
            return model.Courses.Where(c => c.CourseCategoryName == category);
        }
        public Course GetCourse(string name)
        {
            return model.Courses.FirstOrDefault(c => c.Name == name);
        }
    }
}
