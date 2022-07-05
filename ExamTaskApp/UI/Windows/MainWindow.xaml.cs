using ExamTaskApp.UI.Pages;
using ExamTaskApp.Utils;
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

namespace ExamTaskApp
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static string UserName { get; set; }

        public MainWindow()
        {
            InitializeComponent();

            mainFrame.Navigate(new Authorization());
            Navigation.MainFrame = mainFrame;
        }

        private void mainFrame_ContentRendered(object sender, EventArgs e)
        {
            if (Navigation.MainFrame.CanGoBack)
            {
                authPanel.Visibility = Visibility.Visible;
                textUserName.Text = UserName;
            }
            else
                authPanel.Visibility = Visibility.Collapsed;
        }

        private void btnBack_Click(object sender, RoutedEventArgs e) =>
            Navigation.MainFrame.GoBack();
    }
}
