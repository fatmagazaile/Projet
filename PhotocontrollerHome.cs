using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;
using System.Xml.XPath;
using System.Threading;

namespace MvcMeublatexApp.Areas.Photos.Controllers
{
    public class PhotosHomeController : MvcMeublatex.Infrastructure.LocalisedControllerBase
  {
    public ActionResult Index(string albumId)
    {
      // Set the default album id
      if (string.IsNullOrEmpty(albumId)) albumId = "1";

      return View(GetXml(albumId));
    }

    private XDocument GetXml(string albumId)
    {
      // Load the main content document based on the current culture's thread
      var currentCulture = Thread.CurrentThread.CurrentCulture.Name;
      var xmlMainDoc = XDocument.Load(Server.MapPath(string.Format("~/Areas/Photos/Cultures/{0}/PhotoGalleryTile.xml", currentCulture)));
    
      // Load the albums document based on the current culture's thread
      var xmlAlbumsDoc = XElement.Load(Server.MapPath(string.Format("~/Areas/Photos/Cultures/{0}/ImagesRepository.xml", currentCulture)));

      // Retrieve the list of image nodes from the specific album
      var images = from image in xmlAlbumsDoc.XPathSelectElements(string.Format("album[@id='{0}']/image", albumId)) select image;
      var xImages = new XElement("images", new XAttribute("albumId", albumId), images);

      // Construct the Albums xml which will be used for album navigation urls
      var xAlbums = new XElement("albums",
                                 xmlAlbumsDoc.Elements("album").Select(
                                   album => new {album, albId = (string) album.Attribute("id")}).Select(
                                   @t => new XElement("album",
                                                      new XAttribute("id", @t.albId),
                                                      new XAttribute("title", (string) @t.album.Attribute("title")),
                                                      (@t.albId == albumId ? new XAttribute("selected", "true") : null)
                                           ))
        );

      // Append the images and album xml to the main content document
      xmlMainDoc.Element("root").Add(xImages);
      xmlMainDoc.Element("root").Add(xAlbums);
      
      return xmlMainDoc;
    }

  }
}
