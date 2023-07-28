namespace MVC4Bleems.Models
{
    public class Products
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Price { get; set; }
        public string Currency { get; set; }
        public string Image { get; set; }
        public int CategoryId { get; set; }
        public DateTime CreatedAt { get; set; }
        public int Query { get; set; }
        public string CategoryName { get; set; }
        public virtual Categories Category { get; set; } = null!;
    }
}
