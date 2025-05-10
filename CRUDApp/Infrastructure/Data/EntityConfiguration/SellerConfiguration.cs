using Domain.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Data.EntityConfiguration;
internal class SellerConfiguration: IEntityTypeConfiguration<Seller>
{
    public void Configure( EntityTypeBuilder<Seller> builder )
    {
        builder.HasKey( s => s.Id );
        builder.Property( s => s.Name ).IsRequired().HasMaxLength( 100 );
        builder.Property( s => s.Surname ).IsRequired().HasMaxLength( 100 );
        builder.Property( s => s.Phone ).HasMaxLength( 20 );
        builder.Property( s => s.Email ).HasMaxLength( 100 );
        builder.Property( s => s.Salary ).HasColumnType( "decimal(18,2)" );

        builder.HasOne( s => s.Store )
               .WithMany( st => st.Sellers )
               .HasForeignKey( s => s.StoreId )
               .OnDelete( DeleteBehavior.Restrict );
    }
}
