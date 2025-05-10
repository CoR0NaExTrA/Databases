using Domain.Entities;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Services;
public class SupplyService
{
    private readonly ApplicationDbContext _context;

    public SupplyService( ApplicationDbContext context )
    {
        _context = context;
    }

    public async Task<List<Supply>> GetAllSupplies() => await _context.Supply.ToListAsync();

    public async Task AddSupply( Supply supply )
    {
        _context.Supply.Add( supply );
        await _context.SaveChangesAsync();
    }
}
