namespace ExamTaskApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            Order = new HashSet<Order>();
        }

        [Key]
        [StringLength(100)]
        public string ProductArticle { get; set; }

        [Required]
        [StringLength(50)]
        public string ProductName { get; set; }

        [Required]
        public string ProductDescription { get; set; }

        public int ProductCategoryId { get; set; }

        public int ProductManufacturerId { get; set; }

        public int ProductSupplierId { get; set; }

        public decimal ProductCost { get; set; }

        public int? ProductDiscountAmount { get; set; }

        [Required]
        [StringLength(50)]
        public string ProductUnit { get; set; }

        public int ProductQuantityInStock { get; set; }

        [Required]
        [StringLength(50)]
        public string ProductPhoto { get; set; }

        public virtual Manufacturer Manufacturer { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }

        public virtual Supplier Supplier { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Order { get; set; }
    }
}
