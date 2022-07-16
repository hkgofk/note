using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Web_API.Data;

namespace Web_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly ApiDBContext _apiDBContext;

        public ProductController(ApiDBContext apiDBContext)
        {
            _apiDBContext = apiDBContext;
        }
        [HttpGet]
        public IActionResult Get()
        {
            var result = from product in _apiDBContext.Products
                         join lienQuan in _apiDBContext.LienQuanProducts
                         on product.Id equals lienQuan.ProductID
                         select new
                         {
                             ProductName = product.Name,
                             LienQuanName = lienQuan.Name
                         };
                        
            return Ok(result);
        }
    }
}
