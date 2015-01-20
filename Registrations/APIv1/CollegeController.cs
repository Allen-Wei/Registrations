using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Education.Models;

namespace Education.APIv1
{
    public class CollegeController : ApiController
    {
        private EducationModel model = new EducationModel();
        public IEnumerable<College> Get()
        {
            return model.Colleges.Select(c => c);
        }

        public IEnumerable<College> Get(bool canRegistrate)
        {
            return model.Colleges.Where(c => c.CanRegistrate == canRegistrate).Select(c => c);
        }
    }
}
