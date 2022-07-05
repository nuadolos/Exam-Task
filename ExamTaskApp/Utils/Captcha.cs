using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Interop;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace ExamExample.Utils
{
    static public class Captcha
    {
        /// <summary>
        /// Символы, используемые для генерации строки
        /// </summary>
        private const string symbols = "1234567890qwERtYuIOpASdFGhJKLZxCVBNm";
        /// <summary>
        /// Текст, находящийся в капче
        /// </summary>
        public static string CaptchaText { get; private set; }

        /// <summary>
        /// Генерирует капчу со случайными символами
        /// </summary>
        /// <returns></returns>
        public static ImageSource Generate()
        {
            Bitmap bitmap = new Bitmap(150, 50);

            bitmap.Effects();

            return Imaging.CreateBitmapSourceFromHBitmap(
                bitmap.GetHbitmap(), IntPtr.Zero, Int32Rect.Empty, BitmapSizeOptions.FromEmptyOptions());
        }

        /// <summary>
        /// Генерирует случаную четырехсимвольную строку
        /// </summary>
        /// <returns></returns>
        private static string RandomLine()
        {
            string captchaText = string.Empty;
            Random random = new Random();

            for (int i = 0; i < 4; i++)
                captchaText += symbols[random.Next(symbols.Length)];

            return captchaText;
        }

        /// <summary>
        /// Наносит эффекты, ухудшающие читабельность капчи
        /// </summary>
        /// <param name="bitmap"></param>
        private static void Effects(this Bitmap bitmap)
        {
            Random random = new Random();

            Graphics g = Graphics.FromImage(bitmap);
            g.Clear(System.Drawing.Color.White);

            CaptchaText = RandomLine();
            g.DrawString(CaptchaText, new Font("Times New Roman", 36), System.Drawing.Brushes.Black, new PointF(0, -4));

            for (int i = 0; i < bitmap.Width; i++)
            {
                for (int j = 0; j < bitmap.Height; j++)
                {
                    if (random.Next(bitmap.Width) % 50 == 0)
                        g.DrawLine(Pens.White, new PointF(i, j), new PointF(i + random.Next(-10, 10), j + random.Next(-10, 10)));

                    if (random.Next(bitmap.Height) % 10 == 0)
                        bitmap.SetPixel(i, j, System.Drawing.Color.Gray);
                }
            }
        }
    }
}
