﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Registrations.Controllers
{
    public class EducationController : Controller
    {
        //
        // GET: /Education/

        public ActionResult New()
        {
            return View();
        }

    }
}