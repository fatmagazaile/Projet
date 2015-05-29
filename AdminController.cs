using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcMeublatexApp.Models;
using System.IO;
namespace MvcMeublatexApp.Controllers
{
    public class AdminController : Controller
    {
        
        Models.MeublatexDataEntities adm = new MeublatexDataEntities();
        //
        // GET: /Admin/
        [Authorize(Users = "admin")]
        public ActionResult Index()
        {
            return View(adm.Client.ToList());
        }
        [Authorize(Users = "admin")]
        public ActionResult Index_produit()
        {
            return View(adm.Produit.ToList());
        }
                
        //
        // POST: /Image/Upload
        [Authorize(Users = "admin")]
        public ActionResult Edit_produit(int id)
        {

            Models.Produit ProdToEdit = (from a in adm.Produit
                                            where a.Id_prod== id
                                            select a).FirstOrDefault();


            return View(ProdToEdit);
        }

        //
        // POST: /Chambre/Edit

        [HttpPost]
        [AcceptVerbs(HttpVerbs.Post), Authorize]
        public ActionResult Edit_produit(Models.Produit Modified)
        {
            try
            {

                Models.Produit OriginalProduit = (from a in adm.Produit

                                                        where a.Id_prod == Modified.Id_prod
                                                        select a).FirstOrDefault();
                adm.ApplyCurrentValues("Produit", Modified);
                adm.SaveChanges();
                return RedirectToAction("Index_produit");
            }
            catch
            {
                return View();
            }
        }
        
        [Authorize(Users = "admin")]
        public ActionResult Delete_produit(int id)
        {
            Models.Produit chamToDelete = (from a in adm.Produit
                                                 where a.Id_prod == id
                                                 select a).FirstOrDefault();

            return View(chamToDelete);
        }

        //
        // POST: /Admin/Delete/5

        [HttpPost]
        [AcceptVerbs(HttpVerbs.Post), Authorize]
        public ActionResult Delete_produit(int id, FormCollection collection)
        {
            try
            {
                Models.Produit chamInDB = (from a in adm.Produit
                                                 where a.Id_prod == id
                                                 select a).FirstOrDefault();

                adm.DeleteObject(chamInDB);
                adm.SaveChanges();

                return RedirectToAction("Index_produit", "Admin");
            }
            catch
            {
                return View();
            }
        }
        // GET: /Image/Upload
        [Authorize(Users = "admin")]
        public ActionResult Upload()
        {
            return View();
        }

        [Authorize(Users = "admin")]
        [HttpPost]
        public ActionResult Upload(HttpPostedFileBase file,int id)
        {
            ImageRender r = new ImageRender();
            r.UploadImageToDB(file,id);
            return View("Index_produit");

        }
        public ActionResult GetImage(int id)
        {

            var q = (from img in adm.image
                    where img.img_id == id
                    select img.img).FirstOrDefault();


            return File(q, "image/jpg");
        }
        public ActionResult Create_prod()
        {
            return View("Create_prod");
        }

        //
        // POST: /Admin/Create

        [HttpPost]
        public ActionResult Create_prod(Produit p)
        {
            try
            {

                adm.AddToProduit(p);
                adm.SaveChanges();
                return RedirectToAction("Index_prod");
            }
            catch
            {
                return View("Error");
            }
        }
        public ActionResult PasserCommande()
        {
            return View("PasserCommande");
        }

        //
        // POST: /Admin/Passecommande

        [HttpPost]
        public ActionResult PasserCommande(Commande c, int id)
        {
            try
            {
                if (User.Identity.IsAuthenticated)
                {
                    c.Id_cmd = id;
                    adm.AddToCommande(c);
                    adm.SaveChanges();
                    return RedirectToAction("Listcmd");
                }
                else { return RedirectToAction("Create","Client"); }
            }
            catch
            {
                return View("Error");
            }
        }
        //
        // GET: /Admin/Details/5
        [Authorize(Users = "admin")]
        public ActionResult Details(int id)
        {
            Models.Client ClientToDetail = (from a in adm.Client
                                            where a.Id_clt == id
                                            select a).FirstOrDefault();


            return View(ClientToDetail);
        }
        [Authorize(Users = "admin")]
        public ActionResult Details_prod(int id)
        {
            Models.Produit prodToDetail = (from a in adm.Produit
                                            where a.Id_prod == id
                                            select a).FirstOrDefault();


            return View(prodToDetail);
        }

        //
        // GET: /Admin/Create
        [Authorize(Users="admin")]
        public ActionResult Create()
        {
            return View("Create");
        } 

        //
        // POST: /Admin/Create

        [HttpPost]
        [AcceptVerbs(HttpVerbs.Post),Authorize]
        public ActionResult Create(Client c)
        {
           try
            {
                adm.AddToClient(c);
                adm.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View("Error");
            }
        }
        
        //
       
        

        // GET: /Admin/Edit/5
        [Authorize(Users = "admin")]
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Admin/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Admin/Delete/5
        [Authorize(Users = "admin")]
        public ActionResult Delete(int id)
        {
            Models.Client clientToDelete = (from a in adm.Client
                                            where a.Id_clt== id
                                            select a).FirstOrDefault();

            return View(clientToDelete);
        }

        //
        // POST: /Admin/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                Models.Client clientInDB = (from a in adm.Client
                                            where a.Id_clt == id
                                            select a).FirstOrDefault();

                adm.DeleteObject(clientInDB);
                adm.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        [Authorize(Users = "admin")]
        public ActionResult Listcommande(int id)
        {
            var laListe = (from b in adm.Commande
                           join a in adm.Client on b.Id_cmd equals a.Id_cmd
                           where a.Id_clt == id
                           select new ClientCommande
                           {
                               Id_clt = a.Id_clt,
                               Id_cmd = b.Id_cmd,
                               prix_total = (int)b.Prix_total
                           });


            return View(laListe);
        }
        public ActionResult Listcmd()
        {
            var laListe = (from b in adm.Commande
                           join a in adm.Client on b.Id_cmd equals a.Id_cmd
                           where a.Nom_clt == User.Identity.Name
                           select new ClientCommande
                           {
                               Id_clt = a.Id_clt,
                               Id_cmd = b.Id_cmd,
                               prix_total = (int)b.Prix_total
                           });


            return View(laListe);
        }
       
    }
}
