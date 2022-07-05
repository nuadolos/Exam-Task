using ExamTaskApp.Utils;
using ExamExample.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ExamTaskApp.UI.Pages
{
    /// <summary>
    /// Логика взаимодействия для Authorization.xaml
    /// </summary>
    public partial class Authorization : Page
    {
        public Authorization() =>
             InitializeComponent();

        /// <summary>
        /// Входит в систему с помощью учетной записи
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnEntry_Click(object sender, RoutedEventArgs e)
        {
            // Валидация полей
            if (string.IsNullOrWhiteSpace(LoginBox.Text) || string.IsNullOrWhiteSpace(PasBox.Password))
            {
                MessageBox.Show("Заполните пустые поля", 
                    "Авторизация", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (captchaPanel.Visibility == Visibility.Visible)
            {
                if (captchaBox.Text != Captcha.CaptchaText)
                {
                    MessageBox.Show("Капча введена неправильно",
                        "Авторизация", MessageBoxButton.OK, MessageBoxImage.Error);

                    captchaImage.Source = Captcha.Generate();

                    return;
                }
            }

            // Поиск пользователя по данным учетной записи
            var user = Database.Context.User.FirstOrDefault(
                u => u.UserLogin == LoginBox.Text && u.UserPassword == PasBox.Password);

            if (user == null)
            {
                MessageBox.Show("Пользователь не найден",
                    "Авторизация", MessageBoxButton.OK, MessageBoxImage.Error);

                captchaImage.Source = Captcha.Generate();
                captchaPanel.Visibility = Visibility.Visible;

                return;
            }

            captchaPanel.Visibility = Visibility.Collapsed;

            // Отображение ФИО пользователя около кнопки "Назад"
            MainWindow.UserName = $"{user.UserSurname} {user.UserName} {user.UserPatronymic}";

            // Переход на страницу товаров
            Navigation.MainFrame.Navigate(new ProductList(user));

            MessageBox.Show("Вы успешно вошли в систему",
                    "Авторизация", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        /// <summary>
        /// Входит в систему в режиме гостя
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnGuest_Click(object sender, RoutedEventArgs e)
        {
            // Пустое имя, ибо вход выполняет гость
            MainWindow.UserName = string.Empty;

            // Переход на страницу товаров
            Navigation.MainFrame.Navigate(new ProductList());

            MessageBox.Show("Вы вошли в систему в режиме гостя",
                    "Авторизация", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        /// <summary>
        /// Закрывает приложение
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnClose_Click(object sender, RoutedEventArgs e) =>
            Application.Current.Shutdown();
    }
}
