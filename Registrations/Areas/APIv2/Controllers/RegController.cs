using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Registrations.Models;

namespace Registrations.Areas.APIv2.Controllers
{
    public class RegController : Controller
    {
private    RegistrationModel model = new RegistrationModel();
        public JsonResult Apply(Registration reg)
        {
            reg.KeyId = Guid.NewGuid();
            reg.GenerateDate = DateTime.Now;
            reg.Payee = " ";
            reg.Price = 0;
            reg.ReceiptNumber = "";
            reg.Confirm = false;
            model.Registrations.InsertOnSubmit(reg);
            model.SubmitChanges();
            return Json(reg);
        }

    }
}
