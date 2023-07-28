namespace MVC4Bleems.Models
{
    public class Categories
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Products> Products { get; } = new List<Products>();
    }
}
