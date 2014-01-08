using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibrarySystem.Models;

namespace LibrarySystem.Admin
{
    public partial class EditBooks : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<BookDTO> GridViewBooks_GetData()
        {
            var context = new ApplicationDbContext();
            var books = from book in context.Books
                join category in context.Categories on book.CategoryId equals category.Id
                select new BookDTO()
                {
                    Id = book.Id,
                    Title = (book.Title.Length > 17) ? book.Title.Substring(0, 17) + "..." : book.Title,
                    Authors = (book.Author.Length > 17) ? book.Author.Substring(0, 17) + "..." : book.Author,
                    ISBN = (book.ISBN.Length > 17) ? book.ISBN.Substring(0, 17) + "..." : book.ISBN,
                    Website = (book.Website.Length > 17) ? book.Website.Substring(0, 17) + "..." : book.Website,
                    CategoryName = (book.Category.Name.Length > 17) ? book.Category.Name.Substring(0, 17) + "..." : book.Category.Name
                };

            return books.OrderBy(b => b.Title);
        }

        protected void LinkButtonEdit_OnCommand(object sender, CommandEventArgs e)
        {
            this.PanelEditBook.Visible = true;
            int bookId = Convert.ToInt32(e.CommandArgument);
            var context = new ApplicationDbContext();
            var book = context.Books.Find(bookId);
            
            this.TextBoxEditAuthor.Text = book.Author;
            this.TextBoxEditDescription.Text = book.Description;
            this.TextBoxEditISBN.Text = book.ISBN;
            this.TextBoxEditTitle.Text = book.Title;
            this.TextBoxEditWebsite.Text = book.Title;

            var categories = context.Categories.ToList();

            this.DropDownListEditCategory.DataSource = categories;
            this.DropDownListEditCategory.DataTextField = "Name";
            this.DropDownListEditCategory.DataValueField = "Id";
            this.DropDownListEditCategory.DataBind();

            this.DropDownListEditCategory.Items.FindByText(book.Category.Name).Selected = true;
            
            Session.Add("bookId", bookId);
        }

        protected void LinkButtonDelete_OnCommand(object sender, CommandEventArgs e)
        {
            int bookId = Convert.ToInt32(e.CommandArgument);
            var context = new ApplicationDbContext();
            var book = context.Books.Find(bookId);
            context.Books.Remove(book);
            context.SaveChanges();
            Response.Redirect("EditBooks.aspx");
        }

        protected void LinkButtonShowCreatePanel_OnClick(object sender, EventArgs e)
        {
            this.PanelCreateBook.Visible = true;
            var context = new ApplicationDbContext();
            var categories = context.Categories.ToList();
            this.DropDownListAddCategory.DataSource = categories;
            this.DropDownListAddCategory.DataTextField = "Name";
            this.DropDownListAddCategory.DataValueField = "Id";
            this.DropDownListAddCategory.DataBind();
        }

        protected void LinkButtonCreate_OnClick(object sender, EventArgs e)
        {
            this.Page.Validate("ValidateAddBookGroup");
            if (Page.IsValid)
            {
                string title = this.TextBoxAddTitle.Text;
                string author = this.TextBoxAddAuthor.Text;
                string isbn = this.TextBoxAddISBN.Text;
                string website = this.TextBoxAddWebsite.Text;
                string description = this.TextBoxAddDescription.Text;

                var context = new ApplicationDbContext();

                var selectedCategory = this.DropDownListAddCategory.SelectedItem.Text;
                var selectedCategoryEntity = context.Categories.FirstOrDefault(c => c.Name == selectedCategory);

                var book = new Book()
                {
                    Title = title,
                    Author = author,
                    ISBN = isbn,
                    Website = website,
                    Description = description,
                    Category = selectedCategoryEntity
                };

                context.Books.Add(book);
                context.SaveChanges();
                this.PanelCreateBook.Visible = false;
                Response.Redirect("EditBooks.aspx");
            }
        }

        protected void LinkButtonHideCreatePanel_OnClick(object sender, EventArgs e)
        {
            this.TextBoxAddAuthor.Text = string.Empty;
            this.TextBoxAddDescription.Text = string.Empty;
            this.TextBoxAddISBN.Text = string.Empty;
            this.TextBoxAddTitle.Text = string.Empty;
            this.TextBoxAddWebsite.Text = string.Empty;
            this.PanelCreateBook.Visible = false;
        }

        protected void LinkButtonEdit_OnClick(object sender, EventArgs e)
        {
             this.Page.Validate("ValidateEditBookGroup");
            if (Page.IsValid)
            {
                var context = new ApplicationDbContext();

                var selectedCategory = this.DropDownListEditCategory.SelectedItem.Text;
                var selectedCategoryEntity = context.Categories.FirstOrDefault(c => c.Name == selectedCategory);

                int bookId = Convert.ToInt32(Session["bookId"]);
                Session.Remove("bookId");

                var book = context.Books.Find(bookId);
                book.Title = this.TextBoxEditTitle.Text;
                book.Author = this.TextBoxEditAuthor.Text;
                book.ISBN = this.TextBoxEditISBN.Text;
                book.Website = this.TextBoxEditWebsite.Text;
                book.Description = this.TextBoxEditDescription.Text;

                book.Category = selectedCategoryEntity;
                context.SaveChanges();
                this.PanelEditBook.Visible = false;

                Response.Redirect("EditBooks.aspx");
            }
        }

        protected void LinkButtonHideEditPanel_OnClick(object sender, EventArgs e)
        {
            this.TextBoxEditAuthor.Text = string.Empty;
            this.TextBoxEditDescription.Text = string.Empty;
            this.TextBoxEditISBN.Text = string.Empty;
            this.TextBoxEditTitle.Text = string.Empty;
            this.TextBoxEditWebsite.Text = string.Empty;
            this.PanelEditBook.Visible = false;
        }
    }
}