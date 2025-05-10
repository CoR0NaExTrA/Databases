using Domain.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Data.EntityConfiguration;
internal class ProviderConfiguration: IEntityTypeConfiguration<Provider>
{
    public void Configure( EntityTypeBuilder<Provider> builder )
    {
        builder.HasKey( p => p.Id );
        builder.Property( p => p.Name ).IsRequired().HasMaxLength( 100 );
        builder.Property( p => p.ContactPerson ).HasMaxLength( 100 );
        builder.Property( p => p.Phone ).HasMaxLength( 20 );
        builder.Property( p => p.Email ).HasMaxLength( 100 );

        builder.HasMany( p => p.Products )
               .WithOne( pr => pr.Provider )
               .HasForeignKey( pr => pr.ProviderId )
               .OnDelete( DeleteBehavior.Restrict );
    }
}
