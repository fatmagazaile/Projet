using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcMeublatexApp.Models;

namespace MvcMeublatexApp.Controllers
{
    public class ProduitController : Controller
    {
        //
       // GET: /Produit/
        Models.MeublatexDataEntities p = new Models.MeublatexDataEntities();

        public ActionResult Index()
        {
            return View(p.Produit.ToList());
        }
        public ActionResult Index_Bedroomshild()
        {
            try
            {
                List<Produit> q = (from prod in p.Produit
                                    where prod.categorie == "chambre enfant"
                                    select prod).ToList();
                return View(q);
            }
            catch { return View("Error"); }
        }
        public ActionResult Index_Bedroom()
        {
            try
            {
                List<Produit> q = (from prod in p.Produit
                                    where prod.categorie == "chambre couple"
                                    select prod).ToList();
                return View(q);
            }
            catch { return View("Error"); }
        }
        public ActionResult Index_Sejour()
        {
            try
            {
                List<Produit> q = (from prod in p.Produit
                                    where prod.categorie == "sejour"
                                    select prod).ToList();
                return View(q);
            }
            catch { return View("Error"); }
        }
        public ActionResult Index_kitchen()
        {
            try
            {
                List<Produit> q = (from prod in p.Produit
                                    where prod.categorie == "cuisine"
                                    select prod).ToList();
                return View(q);
            }
            catch { return View("Error"); }
        }
        public ActionResult Index_Bathroom()
        {
            try
            {
                List<Produit> q = (from prod in p.Produit
                                    where prod.categorie == "salle de bain"
                                    select prod).ToList();
                return View(q);
            }
            catch { return View("Error"); }
        }
        public ActionResult Index_Livingroom()
        {
            try
            {
                List<Produit> q = (from prod in p.Produit
                                    where prod.categorie == "salon"
                                    select prod).ToList();
                return View(q);
            }
            catch { return View("Error"); }
        }

        [Authorize(Users = "admin")]
        public ActionResult Create_prod()
        {
            return View("Create_prod");
        }

        //
        // POST: /Admin/Create

        [HttpPost]
        public ActionResult Create_prod(Produit pr)
        {
            try
            {

                p.AddToProduit(pr);
                p.SaveChanges();
                return RedirectToAction("Index_produit","Admin");
            }
            catch
            {
                return View("Error");
            }
        }
        
    }
}
