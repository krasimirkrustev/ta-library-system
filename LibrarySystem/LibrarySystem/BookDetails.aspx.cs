using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibrarySystem.Models;

namespace LibrarySystem
{
    public partial class BookDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public Book FormViewBookDetails_GetData()
        {
            int bookId = Convert.ToInt32(Request.Params["id"]);
            var context = new ApplicationDbContext();
            var book = context.Books.FirstOrDefault(b => b.Id == bookId);

            return book;
        }
    }
}