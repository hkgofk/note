using FA.JustBlog.Core.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FA.JustBlog.Core.Services
{
    class CategoryService
    {
        public Category Find(int categoryId)
        {
            var context = new JustBlogContext();
            var category = context.Categories.Where(s => s.Id == categoryId).ToList();
            Category result = new Category();
            foreach (var item in category)
            {
                result.Id = item.Id;
                result.Name = item.Name;
                result.Description = item.Description;
                result.UrlSlug = item.UrlSlug;
            }
            return result;
        }

        public void AddCategory(Category category)
        {
            using (var context = new JustBlogContext())
            {
                context.Add<Category>(category);
                context.SaveChanges();
            }
        }

        public void UpdateCategory(Category category)
        {
            Console.Write("Enter name category:");
            string name = Console.ReadLine();
            Console.Write("Enter urlslug:");
            string urlslug = Console.ReadLine();
            Console.Write("Enter description:");
            string description = Console.ReadLine();
            var std = new Category() { Id = category.Id, Name = name, UrlSlug = urlslug, Description = description };
            using (var context = new JustBlogContext())
            {
                context.Update<Category>(std);
                context.SaveChanges();
            }
        }
        public void DeleteCategory(Category category)
        {
            using (var context = new JustBlogContext())
            {
                try
                {
                    int categoryCheck = context.Posts.Where(s => s.CategoryID == category.Id).Count();
                    if(categoryCheck > 0)
                    {
                        Console.WriteLine("Khong the xoa do phat sinh nghiep vu");
                    }
                    else
                    {
                        context.Remove<Category>(category);
                        context.SaveChanges();
                    }
                    
                }
                catch (DbUpdateConcurrencyException ex)
                {
                    throw new Exception("Record does not exist in the database");
                }                
            }
        }
        public List<Category> GetAllCategories()
        {
            var context2 = new JustBlogContext();
            var categories = context2.Categories.ToList();
            List<Category> listCategories = new List<Category>();
            foreach (var item in categories)
            {
                listCategories.Add(item);
            }
            return listCategories;
        }
    }
}
