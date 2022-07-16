using Microsoft.EntityFrameworkCore;

namespace FA.JustBlog.Core.Models 
{
    class JustBlogContext : DbContext
    {
        public JustBlogContext()
        {

        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=.\SQLEXPRESS02;Database=JustBlogDB;Trusted_Connection=True");
        }

        
        //entities
        public DbSet<Category> Categories { get; set; }
        public DbSet<Post> Posts { get; set; }

    }
}
