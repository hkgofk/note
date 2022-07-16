using FA.JustBlog.Core.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FA.JustBlog.Core.Services
{
    public class PostService
    {
        public Post FindPost(int postId)
        {
            var context = new JustBlogContext();
            var post = context.Posts.Where(s => s.Id == postId);
            Post result = new Post();
            foreach (var item in post)
            {
                result.Id = item.Id;
                result.Modified = item.Modified;
                result.PostContent = item.PostContent;
                result.PostedOn = item.PostedOn;
                result.Title = item.Title;
                result.UrlSlug = item.UrlSlug;
                result.CategoryID = item.CategoryID;
                result.ShortDecription = item.ShortDecription;
            }
            return result;
        }
        public void AddPost(Post post)
        {
            using (var context = new JustBlogContext())
            {
                try
                {
                    context.Add<Post>(post);
                    context.SaveChanges();
                }
                catch (DbUpdateException e)
                {
                    Console.WriteLine("Kiem tra lai category ID");
                    
                }

            }
        }
        public void UpdatePost(Post post)
        {
            Console.Write("Enter title: ");
            string title = Console.ReadLine();
            Console.Write("Enter ShortDescription: ");
            string sDes = Console.ReadLine();
            Console.Write("Enter PostContent: ");
            string pContent = Console.ReadLine();
            Console.Write("Enter UrlSlug: ");
            string UrlSlug = Console.ReadLine();
            Console.Write("Enter PostOn (On/Off): ");
            string PostOn = Console.ReadLine();
            Console.Write("Enter Modified: ");
            string Modified = Console.ReadLine();
            Console.Write("Enter CategoryID: ");
            int CategoryID = int.Parse(Console.ReadLine());
            var std = new Post() { Title = title, ShortDecription = sDes, PostContent = pContent, UrlSlug = UrlSlug, PostedOn = PostOn, Modified = Modified, CategoryID = CategoryID };
            using (var context = new JustBlogContext())
            {
                context.Update<Post>(std);
                context.SaveChanges();
            }
        }
        public void DeletePost(Post post)
        {
            using (var context = new JustBlogContext())
            {
                try
                {                  
                    context.Remove<Post>(post);
                    context.SaveChanges();
                }
                catch (DbUpdateConcurrencyException ex)
                {
                    throw new Exception("Record does not exist in the database");
                }
                
            }
        }
        public void DeletePost(int postId)
        {
            Post post = FindPost(postId);
            using (var context = new JustBlogContext())
            {
                try
                {

                    context.Remove<Post>(post);
                    context.SaveChanges();
                }
                catch (DbUpdateConcurrencyException ex)
                {
                    throw new Exception("Record does not exist in the database");
                }               
            }
        }
        public IList<Post> GetAllPosts()
        {
            var context2 = new JustBlogContext();
            var Posts = context2.Posts.ToList();
            List<Post> listPosts = new List<Post>();
            foreach (var item in Posts)
            {
                listPosts.Add(item);
            }
            return listPosts;
        }
        public IList<Post> GetPublisedPosts()
        {
            var context2 = new JustBlogContext();
            var Posts = context2.Posts.Where(s => s.PostedOn.Equals("On")).ToList();
            List<Post> listPosts = new List<Post>();
            foreach (var item in Posts)
            {
                listPosts.Add(item);
            }
            return listPosts;
        }
    }
}
