using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Infrastructure.Data.EntityConfiguration;
internal class StoreConfiguration: IEntityTypeConfiguration<Store>
{
    public void Configure( EntityTypeBuilder<Store> builder )
    {
        builder.HasKey( st => st.Id );
        builder.Property( st => st.Name ).IsRequired().HasMaxLength( 100 );
        builder.Property( st => st.Phone ).HasMaxLength( 20 );
        builder.Property( st => st.Email ).HasMaxLength( 100 );
    }
}
