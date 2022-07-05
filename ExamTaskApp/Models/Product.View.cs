using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;

namespace ExamTaskApp.Models
{
    public partial class Product
    {
        private string path = Path.GetFullPath(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "../../UI/Picture/"));

        public ImageSource ProdImage
        {
            get => !string.IsNullOrWhiteSpace(ProductPhoto)
                ? (ImageSource)new ImageSourceConverter().ConvertFromString(path + ProductPhoto)
                : (ImageSource)new ImageSourceConverter().ConvertFromString(path + "picture.png");
        }
    }
}
