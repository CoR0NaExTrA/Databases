using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Infrastructure.Data.EntityConfiguration;
internal class ProductConfiguration: IEntityTypeConfiguration<Product>
{
    public void Configure( EntityTypeBuilder<Product> builder )
    {
        builder.HasKey( p => p.Id );
        builder.Property( p => p.Name ).IsRequired().HasMaxLength( 100 );
        builder.Property( p => p.Category ).HasMaxLength( 50 );
        builder.Property( p => p.Price ).HasColumnType( "decimal(18,2)" );
        builder.Property( p => p.Stock ).IsRequired();

        builder.HasOne( p => p.Provider )
               .WithMany( pr => pr.Products )
               .HasForeignKey( p => p.ProviderId )
               .OnDelete( DeleteBehavior.Restrict );
    }
}
