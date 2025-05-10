using Domain.Entities;
using Infrastructure.Data;
using Infrastructure.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Spectre.Console;
using System.Numerics;

var services = new ServiceCollection();

services.AddDbContext<ApplicationDbContext>( options =>
    options.UseSqlServer( "Server=localhost\\SQLEXPRESS;Database=Shop;Trusted_Connection=True;TrustServerCertificate=True;" ) );

services.AddScoped<CustomerService>();
services.AddScoped<ProductService>(); // Добавляем сервисы для всех сущностей
services.AddScoped<SellerService>();
services.AddScoped<SaleService>();
services.AddScoped<StoreService>();
services.AddScoped<SupplyService>();
services.AddScoped<ProviderService>();

var provider = services.BuildServiceProvider();
var customerService = provider.GetRequiredService<CustomerService>();
var productService = provider.GetRequiredService<ProductService>();
var sellerService = provider.GetRequiredService<SellerService>();

async Task ShowMenu()
{
    while ( true )
    {
        var choice = AnsiConsole.Prompt(
            new SelectionPrompt<string>()
                .Title( "[blue]Выберите действие:[/]" )
                .AddChoices( "Работа с клиентами", "Работа с товарами", "Работа с продавцами", "Выход" ) );

        switch ( choice )
        {
            case "Работа с клиентами":
                await CustomerMenu();
                break;
            case "Работа с товарами":
                await ProductMenu();
                break;
            case "Работа с продавцами":
                await SellerMenu();
                break;
            case "Выход":
                return;
        }
    }
}

async Task CustomerMenu()
{
    var choice = AnsiConsole.Prompt(
        new SelectionPrompt<string>()
            .Title( "[green]Меню клиентов:[/]" )
            .AddChoices( "Показать всех клиентов", "Добавить клиента", "Найти по имени клиента", "Удалить клиента", "Назад" ) );

    switch ( choice )
    {
        case "Показать всех клиентов":
            var customers = await customerService.GetAllCustomers();
            customers.ForEach( c => Console.WriteLine( $"{c.Id}: {c.Name}, {c.Email}, {c.RegistrationDate}" ) );
            break;
        case "Добавить клиента":
            var name = AnsiConsole.Ask<string>( "Введите имя клиента:" );
            var phone = AnsiConsole.Ask<string>( "Введите телефон клиента:" );
            var email = AnsiConsole.Ask<string>( "Введите email клиента:" );
            var totalPurchases = AnsiConsole.Ask<int>( "Введите кол-во заказанных продуктов:" );
            await customerService.AddCustomer( new Customer { Name = name, Phone = phone, Email = email, RegistrationDate = DateTime.Now, TotalPurchases = totalPurchases } );
            AnsiConsole.Markup( "[green]Клиент добавлен![/]\n" );
            break;
        case "Найти по имени клиента":
            var searchName = AnsiConsole.Ask<string>( "Введите имя:" );
            var customer = await customerService.FindCustomerByName( searchName );
            if ( customer != null )
                Console.WriteLine( $"Найден: {customer.Name}, {customer.Email}" );
            else
                AnsiConsole.Markup( "[red]Клиент не найден.[/]\n" );
            break;
        case "Удалить клиента":
            var id = AnsiConsole.Ask<int>( "Введите ID клиента:" );
            await customerService.DeleteCustomer( id );
            AnsiConsole.Markup( "[red]Клиент удален.[/]\n" );
            break;
    }
    await CustomerMenu();
}

async Task ProductMenu()
{
    var choice = AnsiConsole.Prompt(
        new SelectionPrompt<string>()
            .Title( "[green]Меню продуктов:[/]" )
            .AddChoices( "Показать все продукты", "Добавить продукт", "Найти по названию продукт", "Удалить продукт", "Назад" ) );

    switch ( choice )
    {
        case "Показать все продукты":
            var products = await productService.GetAllProducts();
            products.ForEach( c => Console.WriteLine( $"{c.Id}: {c.Name}, {c.Price}, {c.Stock}" ) );
            break;
        case "Добавить продукт":
            var name = AnsiConsole.Ask<string>( "Введите название продукта:" );
            var price = AnsiConsole.Ask<int>( "Введите цену продукта:" );
            var stock = AnsiConsole.Ask<int>( "Введите кол-во на складе:" );
            await productService.AddProduct( new Product { Name = name, Price = price, Stock = stock} );
            AnsiConsole.Markup( "[green]Клиент добавлен![/]\n" );
            break;
    }
    await ProductMenu();
}

async Task SellerMenu()
{
    var choice = AnsiConsole.Prompt(
        new SelectionPrompt<string>()
            .Title( "[green]Меню продавцов:[/]" )
            .AddChoices( "Показать всех продавцов", "Добавить продавца", "Найти продавца по имени", "Удалить продукт", "Назад" ) );

    switch ( choice )
    {
        case "Показать всех продавцов":
            var sellers = await sellerService.GetAllSellers();
            sellers.ForEach( c => Console.WriteLine( $"{c.Id}: {c.Name}, {c.Surname}, {c.Email}, {c.Salary}" ) );
            break;
        case "Добавить продавца":
            var name = AnsiConsole.Ask<string>( "Введите имя продавца:" );
            var surname = AnsiConsole.Ask<string>( "Введите фамилию продавца:" );
            var email = AnsiConsole.Ask<string>( "Введите email клиента:" );
            var salary = AnsiConsole.Ask<int>( "Введите зарплату продавца:" );
            await sellerService.AddSeller( new Seller { Name = name, Surname = surname, Email = email, Salary = salary} );
            AnsiConsole.Markup( "[green]Клиент добавлен![/]\n" );
            break;
    }
    await SellerMenu();
}

await ShowMenu();
