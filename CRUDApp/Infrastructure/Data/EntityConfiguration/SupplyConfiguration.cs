using Domain.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Data.EntityConfiguration;
internal class SupplyConfiguration: IEntityTypeConfiguration<Supply>
{
    public void Configure( EntityTypeBuilder<Supply> builder )
    {
        builder.HasKey( s => s.Id );
        builder.Property( s => s.SupplyDate ).IsRequired();
        builder.Property( s => s.TotalCost ).HasColumnType( "decimal(18,2)" );

        builder.HasOne( s => s.Provider )
               .WithMany( p => p.Supplies )
               .HasForeignKey( s => s.ProviderId )
               .OnDelete( DeleteBehavior.Restrict );

        builder.HasOne( s => s.Store )
               .WithMany( st => st.Supplies )
               .HasForeignKey( s => s.StoreId )
               .OnDelete( DeleteBehavior.Restrict );
    }
}
