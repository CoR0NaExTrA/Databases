using Domain.Entities;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Services;
public class SellerService
{
    private readonly ApplicationDbContext _context;

    public SellerService( ApplicationDbContext context )
    {
        _context = context;
    }

    public async Task<List<Seller>> GetAllSellers() => await _context.Seller.ToListAsync();

    public async Task AddSeller( Seller seller )
    {
        _context.Seller.Add( seller );
        await _context.SaveChangesAsync();
    }
}
