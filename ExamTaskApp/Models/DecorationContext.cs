using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace ExamTaskApp.Models
{
    public partial class DecorationContext : DbContext
    {
        public DecorationContext()
            : base("name=DecorationContext")
        {
        }

        public virtual DbSet<Manufacturer> Manufacturer { get; set; }
        public virtual DbSet<Order> Order { get; set; }
        public virtual DbSet<OrderStatus> OrderStatus { get; set; }
        public virtual DbSet<PickupPoint> PickupPoint { get; set; }
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<ProductCategory> ProductCategory { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<Supplier> Supplier { get; set; }
        public virtual DbSet<User> User { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Manufacturer>()
                .HasMany(e => e.Product)
                .WithRequired(e => e.Manufacturer)
                .HasForeignKey(e => e.ProductManufacturerId);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.Product)
                .WithMany(e => e.Order)
                .Map(m => m.ToTable("OrderProduct").MapLeftKey("OrderId").MapRightKey("ProductArticle"));

            modelBuilder.Entity<PickupPoint>()
                .HasMany(e => e.Order)
                .WithRequired(e => e.PickupPoint)
                .HasForeignKey(e => e.OrderPickupPointId);

            modelBuilder.Entity<Product>()
                .Property(e => e.ProductCost)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.User)
                .WithRequired(e => e.Role)
                .HasForeignKey(e => e.UserRoleId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Supplier>()
                .HasMany(e => e.Product)
                .WithRequired(e => e.Supplier)
                .HasForeignKey(e => e.ProductSupplierId);
        }
    }
}
