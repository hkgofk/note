namespace Web_API.Models
{
    public class LienQuanProduct
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int ProductID { get; set; }
        public Product Product { get; set; }
    }
}
