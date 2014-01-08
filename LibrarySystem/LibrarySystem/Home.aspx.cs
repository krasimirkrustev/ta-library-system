using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibrarySystem.Models;

namespace LibrarySystem
{
    public partial class Home : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //var context = new ApplicationDbContext();
            //var categoryWithBooks = context.Categories.Include(c => c.Books).ToList();
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //var context = new ApplicationDbContext();
            //var books = context.Books.Include(b => b.Category).GroupBy(b => b.Category.Name).ToList();
        }

        public IQueryable<CategoryDTO> RepeaterCategoriesAndBooks_GetData()
        {
            var context = new ApplicationDbContext();
            var categoryWithBooks = from category in context.Categories
                select new CategoryDTO()
                {
                    Name = category.Name,
                    Books = (from book in category.Books
                        select new BookDTO()
                        {
                            Id = book.Id,
                            Title = book.Title,
                            Authors = book.Author
                        }).ToList()
                };

            return categoryWithBooks;
        }

        //protected void LinkButtonSearch_OnCommand(object sender, CommandEventArgs e)
        //{
        //    string query = e.CommandArgument.ToString();
        //    Response.Redirect("Search.aspx?q=" + query);
        //}

        protected void LinkButtonSearch_OnClick(object sender, EventArgs e)
        {
            string query = Server.HtmlEncode(this.TextBoxQuery.Text);
            Response.Redirect("Search.aspx?q=" + query);
        }
    }
}