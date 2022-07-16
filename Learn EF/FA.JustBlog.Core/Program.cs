using FA.JustBlog.Core.Models;
using FA.JustBlog.Core.Services;
using System;
using System.Collections.Generic;

namespace FA.JustBlog.Core
{
    class Program
    {
        static void Main(string[] args)
        {
            CategoryService c = new CategoryService();
            PostService p = new PostService();
            int choose = 0;
            do
            {
                Console.WriteLine("\n\n\t\t------------MANAGEMENT POST--------------");
                Console.WriteLine("\t1. Add category");
                Console.WriteLine("\t2. Find category");
                Console.WriteLine("\t3. Update category");
                Console.WriteLine("\t4. Delete category by id");
                Console.WriteLine("\t5. Get all category");
                Console.WriteLine("\t6. Add post");
                Console.WriteLine("\t7. Find post");
                Console.WriteLine("\t8. Update post");
                Console.WriteLine("\t9. Delete post");
                Console.WriteLine("\t10. Get all post");
                Console.WriteLine("\t11. Get publish post");
                Console.WriteLine("\t0. Exit");
                Console.Write("Enter option: ");
                choose = int.Parse(Console.ReadLine());
                switch (choose)
                {
                    case 1:
                        Console.Write("Enter name category: ");
                        string name = Console.ReadLine();
                        Console.Write("Enter urlslug: ");
                        string urlslug = Console.ReadLine();
                        Console.Write("Enter description: ");
                        string description = Console.ReadLine();
                        var std = new Category() { Name = name, UrlSlug = urlslug, Description = description };
                        c.AddCategory(std);
                        break;
                    case 2:
                        Console.Write("Enter id category to find: ");
                        int id = int.Parse(Console.ReadLine());
                        Category temp = c.Find(id);
                        if (temp.Id == 0)
                        {
                            Console.WriteLine("Record does not exist in the database");
                        }
                        else
                        {
                            Console.WriteLine("Id: {0}\tName: {1}\tDecription: {2}\tUrlSlug: {3}", temp.Id, temp.Name, temp.Description, temp.UrlSlug);
                        }
                        break;
                    case 3:
                        Console.Write("Enter id category to update: ");
                        id = int.Parse(Console.ReadLine());
                        temp = c.Find(id);
                        if (temp.Id == 0)
                        {
                            Console.WriteLine("Record does not exist in the database");
                        }
                        else
                        {
                            c.UpdateCategory(temp);
                        }
                        break;
                    case 4:
                        Console.Write("Enter id category to delete: ");
                        id = int.Parse(Console.ReadLine());
                        temp = c.Find(id);
                        if (temp.Id == 0)
                        {
                            Console.WriteLine("Record does not exist in the database");
                        }
                        else
                        {
                            c.DeleteCategory(temp);
                        }
                        break;
                    case 5:

                        List<Category> listCate = c.GetAllCategories();
                        Console.WriteLine("{0,-20}{1,-20}{2,-20}{3,-20}","ID", "Name", "Decription", "UrlSlug");
                        foreach (var item in listCate)
                        {
                            Console.WriteLine("{0,-20}{1,-20}{2,-20}{3,-20}", item.Id, item.Name, item.Description, item.UrlSlug);
                        }
                        break;
                    case 6:
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
                        var std2 = new Post() { Title = title, ShortDecription = sDes, PostContent = pContent, UrlSlug = UrlSlug, PostedOn = PostOn, Modified = Modified, CategoryID = CategoryID };
                        p.AddPost(std2);
                        break;
                    case 7:
                        Console.Write("Enter id post to find: ");
                        id = int.Parse(Console.ReadLine());
                        Post temp2 = p.FindPost(id);
                        if (temp2.Id == 0)
                        {
                            Console.WriteLine("Record does not exist in the database");
                        }
                        else
                        {
                            Console.WriteLine("Id: {0}\tTitle: {1}\tShortDescription: {2}\tUrlSlug: {3}", temp2.Id, temp2.Title, temp2.ShortDecription, temp2.UrlSlug);
                        }
                        break;
                    case 8:
                        Console.Write("Enter id post to update: ");
                        id = int.Parse(Console.ReadLine());
                        temp2 = p.FindPost(id);
                        if (temp2.Id == 0)
                        {
                            Console.WriteLine("Record does not exist in the database");
                        }
                        else
                        {
                            p.UpdatePost(temp2);
                        }
                        break;
                    case 9:
                        Console.Write("Enter id post to delete: ");
                        id = int.Parse(Console.ReadLine());
                        temp2 = p.FindPost(id);
                        if (temp2.Id == 0)
                        {
                            Console.WriteLine("Record does not exist in the database");
                        }
                        else
                        {
                            p.DeletePost(temp2);
                        }
                        break;
                    case 10:
                        List<Post> listPost = (List<Post>)p.GetAllPosts();
                        Console.WriteLine("{0,-20}{1,-20}{2,-20}{3,-20}{4,-20}", "ID", "Title", "ShortDecription", "URL Slug", "Posted On");
                        foreach (var item in listPost)
                        {
                            Console.WriteLine("{0,-20}{1,-20}{2,-20}{3,-20}{4,-20}", item.Id, item.Title, item.ShortDecription, item.UrlSlug, item.PostedOn);
                        }
                        break;
                    case 11:
                        listPost = (List<Post>)p.GetPublisedPosts();
                        Console.WriteLine("{0,-20}{1,-20}{2,-20}{3,-20}{4,-20}","ID", "Title", "ShortDecription", "URL Slug", "Posted On");
                        foreach (var item in listPost)
                        {
                            Console.WriteLine("{0,-20}{1,-20}{2,-20}{3,-20}{4,-20}", item.Id, item.Title, item.ShortDecription, item.UrlSlug, item.PostedOn);
                        }
                        break;

                }
            } while (choose != 0);
        }
    }
    
}
