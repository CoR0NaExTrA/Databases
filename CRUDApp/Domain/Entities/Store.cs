namespace Domain.Entities;
public class Store
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Phone { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;

    public ICollection<Product> Products { get; set; } = new List<Product>();
    public ICollection<Seller> Sellers { get; set; } = new List<Seller>();
    public ICollection<Sale> Sales { get; set; } = new List<Sale>();
    public ICollection<Supply> Supplies { get; set; } = new List<Supply>();
}
