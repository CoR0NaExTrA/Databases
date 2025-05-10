using Domain.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Data.EntityConfiguration;
internal class SaleConfiguration: IEntityTypeConfiguration<Sale>
{
    public void Configure( EntityTypeBuilder<Sale> builder )
    {
        builder.HasKey( s => s.Id );
        builder.Property( s => s.SaleDate ).IsRequired();
        builder.Property( s => s.QuantitySold ).IsRequired();
        builder.Property( s => s.TotalPrice ).HasColumnType( "decimal(18,2)" );

        builder.HasOne( s => s.Customer )
               .WithMany( c => c.Sales )
               .HasForeignKey( s => s.CustomerId )
               .OnDelete( DeleteBehavior.Cascade );

        builder.HasOne( s => s.Store )
               .WithMany( st => st.Sales )
               .HasForeignKey( s => s.StoreId )
               .OnDelete( DeleteBehavior.Restrict );

        builder.HasOne( s => s.Product )
               .WithMany( p => p.Sales )
               .HasForeignKey( s => s.ProductId )
               .OnDelete( DeleteBehavior.Restrict );
    }
}
