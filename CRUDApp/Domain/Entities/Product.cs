namespace Domain.Entities;
public class Product
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Category { get; set; } = string.Empty;
    public decimal Price { get; set; }
    public int Stock { get; set; }
    public int ProviderId { get; set; }
    public Provider Provider { get; set; } = null!;

    public ICollection<Sale> Sales { get; set; } = new List<Sale>();
    public ICollection<Supply> Supplies { get; set; } = new List<Supply>();
}
