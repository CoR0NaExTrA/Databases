using Domain.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Data.EntityConfiguration;
internal class CustomerConfiguration: IEntityTypeConfiguration<Customer>
{
    public void Configure( EntityTypeBuilder<Customer> builder )
    {
        builder.HasKey( c => c.Id );
        builder.Property( c => c.Name ).IsRequired().HasMaxLength( 100 );
        builder.Property( c => c.Phone ).HasMaxLength( 20 );
        builder.Property( c => c.Email ).HasMaxLength( 100 );
        builder.Property( c => c.RegistrationDate ).IsRequired();
        builder.Property( c => c.TotalPurchases ).HasColumnType( "decimal(18,2)" );

        builder.HasMany( c => c.Sales )
               .WithOne( s => s.Customer )
               .HasForeignKey( s => s.CustomerId )
               .OnDelete( DeleteBehavior.Cascade );
    }
}
