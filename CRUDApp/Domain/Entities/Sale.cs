namespace Domain.Entities;
public class Sale
{
    public int Id { get; set; }
    public DateTime SaleDate { get; set; }
    public int StoreId { get; set; }
    public Store Store { get; set; } = null!;
    public int ProductId { get; set; }
    public Product Product { get; set; } = null!;
    public int QuantitySold { get; set; }
    public decimal TotalPrice { get; set; }
    public int CustomerId { get; set; }
    public Customer Customer { get; set; } = null!;
}
