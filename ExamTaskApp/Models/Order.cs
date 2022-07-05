namespace ExamTaskApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Order")]
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            Product = new HashSet<Product>();
        }

        public int OrderId { get; set; }

        public int OrderStatusId { get; set; }

        public DateTime OrderCreateDate { get; set; }

        public DateTime OrderDeliveryDate { get; set; }

        public int OrderPickupPointId { get; set; }

        [StringLength(150)]
        public string OrderUserName { get; set; }

        public int? OrderCode { get; set; }

        public virtual OrderStatus OrderStatus { get; set; }

        public virtual PickupPoint PickupPoint { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product> Product { get; set; }
    }
}
