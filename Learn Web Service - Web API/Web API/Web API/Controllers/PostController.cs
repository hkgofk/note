using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Web_API.Data;
using Web_API.Models;
using Web_API.ViewModels;

namespace Web_API.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("MyPolicyCors")]
    public class PostController : ControllerBase
    {
        private readonly ApiDBContext _apiDBContext;

        public PostController(ApiDBContext apiDBContext)
        {
            _apiDBContext = apiDBContext;
        }
        [HttpGet]
        public IActionResult GetAllPost()
        {
            return Ok(_apiDBContext.Posts.ToList());
        }
        [HttpGet("detail/{id}")]
        public IActionResult GetPostById(int id)
        {
            var post = _apiDBContext.Posts.Find(id);
            if (post == null)
            {
                return NotFound("Post not found!");
            }

            return Ok(post);
        }
        [HttpPost]
        public IActionResult AddPost(CreatePost post)
        {
            var newPost = new Post
            {
                Title = post.Title,
                ShortDecription = post.ShortDecription,
                PostContent = post.PostContent,
                UrlSlug = post.UrlSlug,
                Published = post.Published,
                PostedOn = post.PostedOn,
                Modified = post.Modified,
                CategoryID = post.CategoryID,
                ViewCount = post.ViewCount,
                RateCount = post.RateCount,
                TotalRate = post.TotalRate
        };
            _apiDBContext.Posts.Add(newPost);
            _apiDBContext.SaveChanges();

            return Ok("Add success!");
        }
        [HttpPut]
        public IActionResult UpdatePost(CreatePost post)
        {
            var uPost = _apiDBContext.Posts.Find(post.Id);
            if (uPost == null)
            {
                return NotFound("Post not found!");
            }

            uPost.Title = post.Title;
            uPost.ShortDecription = post.ShortDecription;
            uPost.PostContent = post.PostContent;
            uPost.UrlSlug = post.UrlSlug;
            uPost.Published = post.Published;
            uPost.PostedOn = post.PostedOn;
            uPost.Modified = post.Modified;
            uPost.CategoryID = post.CategoryID;
            uPost.ViewCount = post.ViewCount;
            uPost.RateCount = post.RateCount;
            uPost.TotalRate = post.TotalRate;

            _apiDBContext.SaveChanges();

            return Ok("Update success!");
        }
        [HttpDelete("delete/{id}")]
        public ActionResult DeletePost(int id)
        {
            var dPost = _apiDBContext.Posts.Find(id);
            if (dPost == null)
            {
                return NotFound("Catagory not exitst in database!");
            }
            _apiDBContext.Posts.Remove(dPost);
            _apiDBContext.SaveChanges();

            return Ok("Delete post success!");
        }
    }
}
