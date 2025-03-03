using Domain.Entities;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Services;
public class ProviderService
{
    private readonly ApplicationDbContext _context;

    public ProviderService( ApplicationDbContext context )
    {
        _context = context;
    }

    public async Task<List<Provider>> GetAllProviders() => await _context.Provider.ToListAsync();

    public async Task AddProvider( Provider provider )
    {
        _context.Provider.Add( provider );
        await _context.SaveChangesAsync();
    }

    public async Task<Provider?> FindProviderByName( string name )
    {
        return await _context.Provider.FirstOrDefaultAsync( p => p.Name.Contains( name ) );
    }

    public async Task DeleteProvider( int id )
    {
        var provider = await _context.Provider.FindAsync( id );
        if ( provider != null )
        {
            _context.Provider.Remove( provider );
            await _context.SaveChangesAsync();
        }
    }
}
