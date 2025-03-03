using Domain.Entities;
using Infrastructure.Data;
using Infrastructure.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

var services = new ServiceCollection();

services.AddDbContext<ApplicationDbContext>( options =>
    options.UseSqlServer( "Server=localhost\\SQLEXPRESS;Database=Shop;Trusted_Connection=True;TrustServerCertificate=True;" ) );

services.AddScoped<CustomerService>();

var provider = services.BuildServiceProvider();
var customerService = provider.GetRequiredService<CustomerService>();

async Task ShowMenu()
{
    while ( true )
    {
        Console.WriteLine( "\nМеню:" );
        Console.WriteLine( "1. Показать всех клиентов" );
        Console.WriteLine( "2. Добавить клиента" );
        Console.WriteLine( "3. Найти клиента по имени" );
        Console.WriteLine( "4. Удалить клиента" );
        Console.WriteLine( "5. Статистика клиентов (GROUP BY)" );
        Console.WriteLine( "0. Выход" );

        var choice = Console.ReadLine();
        switch ( choice )
        {
            case "1":
                var customers = await customerService.GetAllCustomers();
                customers.ForEach( c => Console.WriteLine( $"{c.Id}: {c.Name}, {c.Email}" ) );
                break;
            case "2":
                Console.Write( "Имя: " );
                var name = Console.ReadLine();
                Console.Write( "Email: " );
                var email = Console.ReadLine();
                await customerService.AddCustomer( new Customer { Name = name, Email = email, RegistrationDate = DateTime.Now } );
                Console.WriteLine( "Клиент добавлен." );
                break;
            case "3":
                Console.Write( "Введите имя: " );
                var searchName = Console.ReadLine();
                var customer = await customerService.FindCustomerByName( searchName );
                if ( customer != null )
                    Console.WriteLine( $"Найден: {customer.Name}, {customer.Email}" );
                else
                    Console.WriteLine( "Клиент не найден." );
                break;
            case "4":
                Console.Write( "Введите ID клиента: " );
                if ( int.TryParse( Console.ReadLine(), out int id ) )
                {
                    await customerService.DeleteCustomer( id );
                    Console.WriteLine( "Клиент удален." );
                }
                break;
            case "0":
                return;
        }
    }
}

await ShowMenu();
