namespace Domain.Entities;
public class Provider
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string ContactPerson { get; set; } = string.Empty;
    public string Phone { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;

    public ICollection<Product> Products { get; set; } = new List<Product>();
    public ICollection<Supply> Supplies { get; set; } = new List<Supply>();
}
