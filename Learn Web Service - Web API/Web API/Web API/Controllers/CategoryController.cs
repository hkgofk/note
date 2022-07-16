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
    [EnableCors("MyPolicyCors")]
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly ApiDBContext _apiDBContext;

        public CategoryController(ApiDBContext apiDBContext)
        {
            _apiDBContext = apiDBContext;
        }
        [HttpGet]
        public IActionResult GetAllCategory()
        {           
            return Ok(_apiDBContext.Categories);
        }
        [HttpGet("detail/{id}")]
        public IActionResult GetCategoryById(int id)
        {
            var category = _apiDBContext.Categories.Find(id);
            if (category == null)
            {
                return NotFound("Category not found!");
            }

            return Ok(category);
        }
        [HttpPost]
        public IActionResult AddCategory(CreateCategory category)
        {
            var newCategory = new Category
            {
                Name = category.Name,
                UrlSlug = category.UrlSlug,
                Description = category.Description
            };

            _apiDBContext.Categories.Add(newCategory);
            _apiDBContext.SaveChanges();

            return Ok("Add success!");
        }
        [HttpPut]
        public IActionResult UpdateCategory(CreateCategory category)
        {
            var uCategory = _apiDBContext.Categories.Find(category.Id);
            if (uCategory == null)
            {
                return NotFound("Category not found!");
            }

            uCategory.Name = category.Name;
            uCategory.Description = category.Description;
            uCategory.UrlSlug = category.UrlSlug;

            _apiDBContext.SaveChanges();

            return Ok("Update success!");
        }
        [HttpDelete("delete/{id}")]
        public ActionResult DeleteCategory(int id)
        {
            var dCategory = _apiDBContext.Categories.Find(id);
            if (dCategory == null)
            {
                return NotFound("Catagory not exitst in database!");
            }
            _apiDBContext.Categories.Remove(dCategory);
            _apiDBContext.SaveChanges();

            return Ok("Delete category success!");
        }

    }
}
