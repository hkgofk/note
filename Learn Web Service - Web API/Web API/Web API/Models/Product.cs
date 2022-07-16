namespace Web_API.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public ICollection<LienQuanProduct> lienQuanProducts { get; set; }
    }
}
