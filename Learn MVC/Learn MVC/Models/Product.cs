namespace Learn_MVC.Models
{
    public class Product
    {
        public int ProductID { get; set; }
        public string Name { get; set; } 
        public string? Category { get; set; }
        public string? Color { get; set; }
        public decimal UnitPrice { get; set; }
        public int AvailableQuantity { get; set; }

    }
}
