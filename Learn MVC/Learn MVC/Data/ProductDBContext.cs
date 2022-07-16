using Learn_MVC.Models;
using Microsoft.EntityFrameworkCore;

namespace Learn_MVC.Data
{
    public class ProductDBContext : DbContext
    {
        public ProductDBContext(DbContextOptions<ProductDBContext> options):base(options)
        {

        }
        public DbSet<Product> Products { get; set; }
    }

}
