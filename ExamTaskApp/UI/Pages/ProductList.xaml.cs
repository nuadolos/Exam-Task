using ExamTaskApp.Models;
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

namespace ExamTaskApp.UI.Pages
{
    /// <summary>
    /// Логика взаимодействия для ProductList.xaml
    /// </summary>
    public partial class ProductList : Page
    {
        public ProductList(User user = null)
        {
            InitializeComponent();

            sortBox.SelectedIndex = 0;
            filtBox.SelectedIndex = 0;

            if (user != null && user?.Role.Name != "Клиент")
                panelNoClient.Visibility = Visibility.Visible;
        }

        private void SortedProducts()
        {
            var products = Database.Context.Product.AsEnumerable();
            int allCount = products.Count();

            if (!string.IsNullOrWhiteSpace(searchBox.Text) && searchBox.Text != "Введите для поиска")
                products = products.Where(p => p.ProductName.ToLower().Contains(searchBox.Text.ToLower()));

            switch (filtBox.SelectedIndex)
            {
                case 1:
                    products = products.Where(p => p.ProductDiscountAmount.Value < 10 || p.ProductDiscountAmount.HasValue == false);
                    break;
                case 2:
                    products = products.Where(p => p.ProductDiscountAmount.Value >= 10 && p.ProductDiscountAmount.Value < 15);
                    break;
                case 3:
                    products = products.Where(p => p.ProductDiscountAmount.Value >= 15);
                    break;
            }

            switch (sortBox.SelectedIndex)
            {
                case 1:
                    if (checkDecreasing.IsChecked == true)
                        products = products.OrderByDescending(p => p.ProductCost);
                    else
                        products = products.OrderBy(p => p.ProductCost);
                    break;
            }

            int remained = products.Count();
            textDataCount.Text = $"Всего выведено товаров: {remained} из {allCount}";
            productView.ItemsSource = products.ToList();
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (searchBox.Text != "Введите для поиска")
                SortedProducts();
        }

        private void searchBox_GotFocus(object sender, RoutedEventArgs e)
        {
            searchBox.Text = string.Empty;
        }

        private void searchBox_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(searchBox.Text))
                searchBox.Text = "Введите для поиска";
        }

        private void checkDecreasing_Checked(object sender, RoutedEventArgs e)
        {
            SortedProducts();
        }

        private void checkDecreasing_Unchecked(object sender, RoutedEventArgs e)
        {
            SortedProducts();
        }

        private void filtBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SortedProducts();
        }

        private void sortBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SortedProducts();
        }

        private void btnOrder_Click(object sender, RoutedEventArgs e)
        {
            Navigation.MainFrame.Navigate(new OrderList());
        }
    }
}
