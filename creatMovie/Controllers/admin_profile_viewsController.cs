using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace creatMovie.Controllers
{
    public class admin_profile_viewsController : Controller
    { 
        
        // GET: actor_profile
        public ActionResult actor_profile()
        {
            return View();
        }

        // GET: director_profile
        public ActionResult director_profile()
        {
            return View();
        }

        // GET: director_profile
        public ActionResult movie_profile()
        {
            return View();
        }

    }
}