using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibrarySystem.Models;

namespace LibrarySystem
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Book> RepeaterSearchResult_GetData()
        {
            string query = Request.Params["q"];
            this.LiteralQuery.Text = query.ToLower();
            var context = new ApplicationDbContext();
            if (string.IsNullOrEmpty(query))
            {
                return context.Books.Include(b => b.Category);
            }
            return context.Books.Include(b => b.Category)
                .Where(b => b.Author.ToLower().Contains(query.ToLower()) 
                    || b.Title.ToLower().Contains(query.ToLower()));

            //var books = context.Books.Include(b => b.Category).Where(b => b.Author.Contains(query) && b.Title.Contains(query));

            //var result = books.ToList();
        }
    }
}