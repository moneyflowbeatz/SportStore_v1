using System;
using System.Collections.Generic;
using System.IO;

namespace SportStore.Models;

public partial class Product
{
    public int Id { get; set; }

    public string? ArticleNumber { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public string Category { get; set; } = null!;

    public string Photo { get; set; } = null!;

    public string Manufacturer { get; set; } = null!;

    public string Supplier { get; set; } = null!;

    public string Unit { get; set; } = null!;

    public decimal Cost { get; set; }

    public decimal MaxDiscount { get; set; }

    public decimal DiscountAmount { get; set; }

    public int QuantityInStock { get; set; }

    public virtual string? ImagePath
    {

        get
        {
            if (File.Exists(System.IO.Path.Combine(Environment.CurrentDirectory, $"images/{Photo}")))
            {
                return System.IO.Path.Combine(Environment.CurrentDirectory, $"images/{Photo}");
            }
            else
            {
                Photo = "picture.png";
                return null;
            }
        }

    }
    public string Status { get; set; } = null!;

    public virtual ICollection<OrderProduct> OrderProducts { get; set; } = new List<OrderProduct>();
    
}
