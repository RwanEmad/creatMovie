using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace creatMovie.Controllers
{
    public class movieController : Controller
    {
        // GET: ctreate_movie
        public ActionResult create_movie()
        {
            return View();
        }
     // GET: edit_movie
        public ActionResult edit_movie()
        {
            return View();
        }
     // GET: ctreate_movie
        public ActionResult delete_movie()
        {
            return View();
        }
    }
}