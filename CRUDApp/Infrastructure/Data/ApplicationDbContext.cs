using Domain.Entities;
using Infrastructure.Data.EntityConfiguration;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Data;
public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext( DbContextOptions<ApplicationDbContext> options )
            : base( options ) { }

    public DbSet<Customer> Customer { get; set; }
    public DbSet<Provider> Provider { get; set; }
    public DbSet<Sale> Sale { get; set; }
    public DbSet<Seller> Seller { get; set; }
    public DbSet<Store> Store { get; set; }
    public DbSet<Supply> Supply { get; set; }
    public DbSet<Product> Product { get; set; }

    protected override void OnModelCreating( ModelBuilder modelBuilder )
    {
        base.OnModelCreating( modelBuilder );
        modelBuilder.ApplyConfiguration( new CustomerConfiguration() );
        modelBuilder.ApplyConfiguration( new ProviderConfiguration() );
        modelBuilder.ApplyConfiguration( new SaleConfiguration() );
        modelBuilder.ApplyConfiguration( new SellerConfiguration() );
        modelBuilder.ApplyConfiguration( new StoreConfiguration() );
        modelBuilder.ApplyConfiguration( new SupplyConfiguration() );
        modelBuilder.ApplyConfiguration( new ProductConfiguration() );
    }
}
