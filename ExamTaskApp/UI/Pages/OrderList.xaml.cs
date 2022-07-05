using ExamTaskApp.UI.Windows;
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
    /// Логика взаимодействия для OrderList.xaml
    /// </summary>
    public partial class OrderList : Page
    {
        public OrderList()
        {
            InitializeComponent();

            sortBox.SelectedIndex = 0;
            filtBox.SelectedIndex = 0;
        }

        private void SortedOrders()
        {
            var orders = Database.Context.Order.AsEnumerable();

            switch (filtBox.SelectedIndex)
            {
                case 1:
                    orders = orders.Where(p => p.OrderAllDiscount < 11);
                    break;
                case 2:
                    orders = orders.Where(p => p.OrderAllDiscount >= 11 && p.OrderAllDiscount < 15);
                    break;
                case 3:
                    orders = orders.Where(p => p.OrderAllDiscount >= 15);
                    break;
            }

            switch (sortBox.SelectedIndex)
            {
                case 1:
                    if (checkDecreasing.IsChecked == true)
                        orders = orders.OrderByDescending(p => p.OrderAllSum);
                    else
                        orders = orders.OrderBy(p => p.OrderAllSum);
                    break;
            }

            orderView.ItemsSource = orders.ToList();
        }

        private void btnChangeStatus_Click(object sender, RoutedEventArgs e)
        {
            ChangeStatus window = new ChangeStatus();

            if (window.ShowDialog() == true)
            {

            }
        }

        private void checkDecreasing_Checked(object sender, RoutedEventArgs e)
        {
            SortedOrders();
        }

        private void checkDecreasing_Unchecked(object sender, RoutedEventArgs e)
        {
            SortedOrders();
        }

        private void filtBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SortedOrders();
        }

        private void sortBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SortedOrders();
        }

        private void btnThrowOff_Click(object sender, RoutedEventArgs e)
        {
            sortBox.SelectedIndex = 0;
            filtBox.SelectedIndex = 0;

            orderView.ItemsSource = Database.Context.Order.ToList();
        }
    }
}
