using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MvcMeublatexApp.Models;
using System.IO;

namespace MvcMeublatexApp
{
    public class ListeImage
    {
        Models.MeublatexDataEntities a = new MeublatexDataEntities();
        public byte[] GetImages(int id)
        {
            image img = new image();

            var q = from img2 in a.image
                    where img.img_id == id
                    select img.img;

            byte[] image = q.FirstOrDefault();

            return image;
        }
        

    }
}
