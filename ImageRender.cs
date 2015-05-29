using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using MvcMeublatexApp.Models;

namespace MvcMeublatexApp
{
    public class ImageRender
    {
        image img = new image();


        public void UploadImageToDB(HttpPostedFileBase file,int id)
        {
            img.img_id= id;
            img.img_name = file.FileName;
            img.img = ConvertToBytes(file);
            using (MeublatexDataEntities a = new MeublatexDataEntities())
            {
                a.image.AddObject(img);
                a.SaveChanges();
            }
        }

        public byte[] ConvertToBytes(HttpPostedFileBase Image)
        {
            byte[] imageBytes = null;
            BinaryReader reader = new BinaryReader(Image.InputStream);
            imageBytes = reader.ReadBytes((int)Image.ContentLength);
            return imageBytes;
        }
    }
}
