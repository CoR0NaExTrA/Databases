using Domain.Entities;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Services;
public class ProductService
{
    private readonly ApplicationDbContext _context;

    public ProductService( ApplicationDbContext context )
    {
        _context = context;
    }

    public async Task<List<Product>> GetAllProducts() => await _context.Product.ToListAsync();

    public async Task AddProduct( Product product )
    {
        _context.Product.Add( product );
        await _context.SaveChangesAsync();
    }
}