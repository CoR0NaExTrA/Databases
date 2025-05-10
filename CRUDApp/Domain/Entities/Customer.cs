namespace Domain.Entities;
public class Customer
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Phone { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public DateTime RegistrationDate { get; set; }
    public decimal TotalPurchases { get; set; }

    public ICollection<Sale> Sales { get; set; } = new List<Sale>();
}
