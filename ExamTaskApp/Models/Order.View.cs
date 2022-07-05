using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamTaskApp.Models
{
    public partial class Order
    {
        public string OrderStructure
        {
            get
            {
                string orderStructure = string.Empty;

                foreach (var product in Product)
                {
                    orderStructure += product.ProductName + ", ";
                }

                return orderStructure.Remove(orderStructure.Length - 2, 2);
            }
        }

        public decimal OrderAllSum
        {
            get
            {
                decimal sum = 0;

                foreach (var product in Product)
                {
                    if (product.ProductDiscountAmount.HasValue)
                        sum += product.ProductCost * product.ProductDiscountAmount.Value;
                    else
                        sum += product.ProductCost;
                }

                return sum;
            }
        }

        public int OrderAllDiscount
        {
            get
            {
                int sumDiscount = 0;

                foreach (var product in Product)
                {
                    sumDiscount += product.ProductDiscountAmount.Value;
                }

                return sumDiscount;
            }
        }

        public bool StockAvailability
        {
            get 
            {
                bool isAvailability = true;

                foreach (var product in Product)
                {
                    if (product.ProductQuantityInStock <= 3)
                        return false;
                }

                return isAvailability;
            }
        }
    }
}
