﻿using SportStore.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace SportStore
{
    /// <summary>
    /// Логика взаимодействия для AddProductWindow.xaml
    /// </summary>
    public partial class AddProductWindow : Window
    {

        Product? currentProduct;
        string? oldImage;
        string? newImage;
        string? newImagePath;

        public decimal MaxDiscount { get; set; }
        public decimal DiscountAmount { get; set; }
        public AddProductWindow()
        {
            InitializeComponent();
            using (SportStoreContext db = new SportStoreContext())
            {
                categoryBox.ItemsSource = db.Products.Select(p => p.Category).Distinct().ToList();
            }
        }

        private void saveProductButtonClick(object sender, RoutedEventArgs e)
        {
            using (SportStoreContext db = new SportStoreContext())
            {
                #region Валидация
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrWhiteSpace(articleBox.Text))
                    errors.AppendLine("Укажите артикль");
                if (string.IsNullOrWhiteSpace(nameBox.Text))
                    errors.AppendLine("Укажите название");
                if (string.IsNullOrWhiteSpace(descriptionBox.Text))
                    errors.AppendLine("Укажите описание");
                if (string.IsNullOrWhiteSpace(categoryBox.Text))
                    errors.AppendLine("Укажите категорию");
                if (string.IsNullOrWhiteSpace(manufacturerBox.Text))
                    errors.AppendLine("Укажите производителя");
                if (string.IsNullOrWhiteSpace(costBox.Text))
                    errors.AppendLine("Укажите цену");

                if (string.IsNullOrWhiteSpace(discountAmountBox.Text))
                    errors.AppendLine("Укажите размер скидки");
                if (string.IsNullOrWhiteSpace(quantityInStockBox.Text))
                    errors.AppendLine("Укажите количество на складе");
                if (string.IsNullOrWhiteSpace(statusBox.Text))
                    errors.AppendLine("Укажите статус");
                if (string.IsNullOrWhiteSpace(maxDiscountBox.Text))
                    errors.AppendLine("Укажите максимальную скидку");
                if (string.IsNullOrWhiteSpace(supplierBox.Text))
                    errors.AppendLine("Укажите поставщика");
                if (string.IsNullOrWhiteSpace(unitBox.Text))
                    errors.AppendLine("Укажите единицы измерения");

                //
                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString());
                    return;
                }
                #endregion
                try
                {
                    Product product = new Product()
                    {

                        ArticleNumber = articleBox.Text,
                        Name = nameBox.Text,
                        Description = descriptionBox.Text,
                        Category = categoryBox.Text,
                        Photo = imageBox.Text, // "picture.png",
                        Manufacturer = manufacturerBox.Text,
                        Cost = Convert.ToDecimal(costBox.Text),
                        DiscountAmount = Convert.ToInt32(discountAmountBox.Text),
                        QuantityInStock = Convert.ToInt32(quantityInStockBox.Text),
                        Status = statusBox.Text,
                        MaxDiscount = Convert.ToDecimal(maxDiscountBox.Text),
                        Supplier = supplierBox.Text,
                        Unit = unitBox.Text


                    };


                    if (product.Cost < 0)
                    {
                        MessageBox.Show("Цена должна быть положительной!");
                        return;
                    }

                    if (product.QuantityInStock < 0)
                    {
                        MessageBox.Show("Количество товаров на складе не может быть меньше нуля!");
                        return;
                    }

                    db.Products.Add(product);

                    if (String.IsNullOrEmpty(newImage))
                    {
                        product.Photo = "picture.png";
                        BitmapImage image = new BitmapImage(new Uri(product.ImagePath));
                        image.CacheOption = BitmapCacheOption.OnLoad;
                        imageBoxPath.Source = image;
                    }
                    else
                    {
                        string newRelativePath = $"{System.DateTime.Now.ToString("HHmmss")}_{newImage}";
                        product.Photo = newRelativePath;

                        File.Copy(newImagePath, System.IO.Path.Combine(Environment.CurrentDirectory, $"images/{newRelativePath}"));

                        BitmapImage image = new BitmapImage(new Uri(product.ImagePath));
                        image.CacheOption = BitmapCacheOption.OnLoad;

                        imageBoxPath.Source = image;
                    }

                    db.SaveChanges();

                    MessageBox.Show("Продукт успешно добавлен!");

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }


            }
        }

        private void AddImageToUser(object sender, RoutedEventArgs e)
        {

            Stream myStream;

            if (currentProduct != null)
            {
                oldImage = System.IO.Path.Combine(Environment.CurrentDirectory, $"images/{currentProduct.Photo}");
            }
            else
            {
                oldImage = null;    
            }

            // проверяем, есть ли изображение у товара и запоминаем путь к изображению сейчас
            Microsoft.Win32.OpenFileDialog dlg = new Microsoft.Win32.OpenFileDialog();

            if (dlg.ShowDialog() == true)
            {
                if ((myStream = dlg.OpenFile()) != null)
                {
                    dlg.DefaultExt = ".png";
                    dlg.Filter = "JPEG Files (*.jpeg)|*.jpeg|PNG Files (*.png)|*.png|JPG Files (*.jpg)|*.jpg|GIF Files (*.gif)|*.gif";
                    dlg.Title = "Open Image";
                    dlg.InitialDirectory = "./";

                    // Предпросмотр изображения
                    BitmapImage image = new BitmapImage();
                    image.BeginInit();
                    image.CacheOption = BitmapCacheOption.OnLoad;
                    image.CreateOptions = BitmapCreateOptions.IgnoreImageCache;
                    image.UriSource = new Uri(dlg.FileName);

                    image.DecodePixelWidth = 200;
                    image.DecodePixelHeight = 300;
                    imageBoxPath.Source = image;
                    image.EndInit();

                    try
                    {
                        newImage = dlg.SafeFileName;
                        newImagePath = dlg.FileName;
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }

                myStream.Dispose();
            }

        }
    }
}
