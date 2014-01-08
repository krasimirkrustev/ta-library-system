using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibrarySystem.Models;

namespace LibrarySystem.Admin
{
    public partial class EditCategories : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public IQueryable<Category> GridViewCategories_GetData()
        {
            var context = new ApplicationDbContext();
            var categories = context.Categories.OrderBy(c => c.Name);

            return categories;
        }

        protected void LinkButtonShowCreatePanel_OnClick(object sender, EventArgs e)
        {
            this.PanelCreateCategory.Visible = true;
        }

        protected void LinkButtonHideCreatePanel_OnClick(object sender, EventArgs e)
        {
            this.TextBoxAddCategory.Text = string.Empty;
            this.PanelCreateCategory.Visible = false;
        }

        protected void LinkButtonCreate_OnClick(object sender, EventArgs e)
        {
            this.Page.Validate("ValidateAddCategoryGroup");
            if (Page.IsValid)
            {
                string categoryName = this.TextBoxAddCategory.Text;
                this.TextBoxAddCategory.Text = string.Empty;
                var context = new ApplicationDbContext();

                var category = new Category()
                {
                    Name = categoryName
                };
                context.Categories.Add(category);
                context.SaveChanges();
                this.PanelCreateCategory.Visible = false;
                Response.Redirect("EditCategories.aspx");    
            }
        }

        protected void LinkButtonEdit_OnClick(object sender, EventArgs e)
        {
            this.Page.Validate("ValidateEditCategoryGroup");
            if (Page.IsValid)
            {
                int categoryId = Convert.ToInt32(Session["categoryId"]);
                Session.Remove("categoryId");

                var categoryName = this.TextBoxEditCategory.Text;
                var context = new ApplicationDbContext();
                var category = context.Categories.Find(categoryId);
                category.Name = categoryName;
                context.SaveChanges();
                this.PanelEditCategory.Visible = false;
                this.GridViewCategories.DataBind();
            }
        }

        protected void LinkButtonHideEditPanel_OnClick(object sender, EventArgs e)
        {
            this.TextBoxEditCategory.Text = string.Empty;
            this.PanelEditCategory.Visible = false;
        }

        protected void LinkButtonEdit_OnCommand(object sender, CommandEventArgs e)
        {
            this.PanelEditCategory.Visible = true;
            int categoryId = Convert.ToInt32(e.CommandArgument);
            var context = new ApplicationDbContext();
            var category = context.Categories.Find(categoryId);
            this.TextBoxEditCategory.Text = category.Name;
            Session.Add("categoryId", categoryId);
        }

        protected void LinkButtonDelete_OnCommand(object sender, CommandEventArgs e)
        {
            int categoryId = Convert.ToInt32(e.CommandArgument);
            var context = new ApplicationDbContext();
            var category = context.Categories.Find(categoryId);
            context.Categories.Remove(category);
            context.SaveChanges();
            this.GridViewCategories.DataBind();
        }
    }
}