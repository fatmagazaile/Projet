using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcMeublatexApp.Models;
namespace MvcMeublatexApp.Controllers
{
    public class ClientController : Controller
    {
        //
        // GET: /Client/
        Models.MeublatexDataEntities clt = new MeublatexDataEntities();
        public ActionResult Index()
        {
            return View("Index");
        }
        public ActionResult Create()
        {
            return View("Create");
        }

        //
        // POST: /Admin/Create

        [HttpPost]
        public ActionResult Create(Client c)
        {
            try
            {
                clt.AddToClient(c);
                clt.SaveChanges();
                return RedirectToAction("Index","Produit");
            }
            catch
            {
                return View("Error");
            }
        }
        public ActionResult Edit(int id)
        {

            Models.Client ClientToEdit = (from a in clt.Client
                                          where a.Id_clt == id
                                          select a).FirstOrDefault();


            return View(ClientToEdit);
        }

        //
        // POST: /Client/Edit

        [HttpPost]
        public ActionResult Edit(Models.Client Modified)
        {
            try
            {

                Models.Client OriginalClient = (from a in clt.Client

                                                where a.Id_clt == Modified.Id_clt
                                                select a).FirstOrDefault();
                clt.ApplyCurrentValues("Client", Modified);
                clt.SaveChanges();
                return RedirectToAction("Index","Admin");
            }
            catch
            {
                return View();
            }
        }
        public ActionResult Listcommande(int id)
        {
            var laListe = (from b in clt.Commande
                           join a in clt.Client on b.Id_cmd equals a.Id_cmd
                           where a.Id_clt == id
                           select new ClientCommande
                           {
                               Id_clt = a.Id_clt,
                               Id_cmd= b.Id_cmd,
                               prix_total =(int)b.Prix_total
                           });


            return View(laListe);
        }
       
        
    }
}
