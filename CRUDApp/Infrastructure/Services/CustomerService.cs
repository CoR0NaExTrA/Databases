using Domain.Entities;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Services;

public class CustomerService
{
    private readonly ApplicationDbContext _context;

    public CustomerService( ApplicationDbContext context )
    {
        _context = context;
    }

    public async Task<List<Customer>> GetAllCustomers()
    {
        return await _context.Customer.ToListAsync();
    }

    public async Task AddCustomer( Customer customer )
    {
        _context.Customer.Add( customer );
        await _context.SaveChangesAsync();
    }

    public async Task<Customer?> FindCustomerByName( string name )
    {
        return await _context.Customer.FirstOrDefaultAsync( c => c.Name.Contains( name ) );
    }

    public async Task DeleteCustomer( int id )
    {
        var customer = await _context.Customer.FindAsync( id );
        if ( customer != null )
        {
            _context.Customer.Remove( customer );
            await _context.SaveChangesAsync();
        }
    }
}
