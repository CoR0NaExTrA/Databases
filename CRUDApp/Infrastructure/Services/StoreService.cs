using Domain.Entities;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Services;
public class StoreService
{
    private readonly ApplicationDbContext _context;

    public StoreService( ApplicationDbContext context )
    {
        _context = context;
    }

    public async Task<List<Store>> GetAllStores() => await _context.Store.ToListAsync();

    public async Task AddStore( Store store )
    {
        _context.Store.Add( store );
        await _context.SaveChangesAsync();
    }
}