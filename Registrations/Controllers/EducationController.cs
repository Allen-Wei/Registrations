using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Microsoft.Ajax.Utilities;
using Registrations.Models;
using WebGrease.Css.Extensions;

namespace Registrations.Controllers
{
    public class EducationController : Controller
    {
        RegistrationModel model = new RegistrationModel();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Receipt(int id)
        {
            var reg = model.Registrations.FirstOrDefault(r => r.Id == id);
            if (reg == null) { Response.Redirect("/"); }
            return View(reg);
        }

        public ActionResult Demo()
        {
            return View();
        }

        public string GenerateManifest()
        {
            StringBuilder manifest = new StringBuilder();
            var files = GetFiles("fonts");
            files.AddRange(GetFiles("Styles"));
            files.AddRange(GetFiles("Styles/images"));
            files.AddRange(GetFiles("Partials/Education"));
            files.AddRange(GetFiles("Scripts/angular"));
            files.AddRange(GetFiles("Vendors"));
            files.ForEach(f => manifest.AppendFormat("{0}<br />", f));
            return manifest.ToString();
        }

        private List<string> GetFiles(string folderName)
        {
            var path = Server.MapPath(String.Format("~/{0}", folderName));
            var dir = new DirectoryInfo(path);
            return dir.GetFiles().Select(f => String.Format("/Registrations/{0}/{1}", folderName, f.Name)).ToList();
        }
    }
}
