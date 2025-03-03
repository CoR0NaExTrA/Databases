using Domain.Entities;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Services;
public class SaleService
{
    private readonly ApplicationDbContext _context;

    public SaleService( ApplicationDbContext context )
    {
        _context = context;
    }

    public async Task<List<Sale>> GetAllSales() => await _context.Sale.ToListAsync();

    public async Task AddSale( Sale sale )
    {
        _context.Sale.Add( sale );
        await _context.SaveChangesAsync();
    }
}
