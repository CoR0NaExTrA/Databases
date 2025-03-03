namespace Domain.Entities;
public class Supply
{
    public int Id { get; set; }
    public int ProviderId { get; set; }
    public Provider Provider { get; set; } = null!;
    public int StoreId { get; set; }
    public Store Store { get; set; } = null!;
    public List<Product> Products { get; set; } = new List<Product>();
    public DateTime SupplyDate { get; set; }
    public decimal TotalCost { get; set; }
}
