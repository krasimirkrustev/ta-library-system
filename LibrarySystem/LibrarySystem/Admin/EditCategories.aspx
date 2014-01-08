<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditCategories.aspx.cs" Inherits="LibrarySystem.Admin.EditCategories" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <h1>Edit Categories</h1>
        </div>
    </div>
    <div class="row">
        <div class="span4 offset4">
            <asp:ValidationSummary
                    ForeColor="Red"
                    DisplayMode="List"
                    EnableClientScript="true"
                    runat="server" ValidationGroup="ValidateEditCategoryGroup" /> 
            <asp:ValidationSummary
                    ForeColor="Red"
                    DisplayMode="List"
                    EnableClientScript="true"
                    runat="server" ValidationGroup="ValidateAddCategoryGroup" /> 
        </div>
    </div>
    <div class="row">
        <asp:GridView ID="GridViewCategories" runat="server" ItemType="LibrarySystem.Models.Category"
            SelectMethod="GridViewCategories_GetData" AutoGenerateColumns="False" CssClass="gridview"
            AllowPaging="True" PageSize="5" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Category Name" SortExpression="Name"/>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Action
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButtonEdit" runat="server" 
                            CommandArgument="<%#: Item.Id %>" OnCommand="LinkButtonEdit_OnCommand"
                            Text="Edit" CssClass="link-button"/> 
                        <asp:LinkButton ID="LinkButtonDelete" runat="server"
                            CommandArgument="<%#: Item.Id %>" OnCommand="LinkButtonDelete_OnCommand" 
                            Text="Delete" CssClass="link-button"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div class="create-link">
            <asp:LinkButton runat="server"></asp:LinkButton>
                <asp:LinkButton ID="LinkButtonShowCreatePanel" runat="server" CssClass="link-button" OnClick="LinkButtonShowCreatePanel_OnClick">Create New</asp:LinkButton>
        </div>
        <asp:Panel ID="PanelCreateCategory" runat="server" CssClass="panel" Visible="False">
            <h2>Create New Category</h2>
            <asp:Label runat="server"  AssociatedControlID="TextBoxEditCategory" Text="Category: ">
                <asp:TextBox ID="TextBoxAddCategory" runat="server" placeholder="Enter Category name..."></asp:TextBox>   
                <asp:RequiredFieldValidator
                    ID="rfvAddCategory"
                    runat="server" ForeColor="Red" Display="Dynamic"
                    ErrorMessage="Category field is required!"
                    ControlToValidate="TextBoxAddCategory" EnableClientScript="False" Text="*"
                    ValidationGroup="ValidateAddCategoryGroup">
                </asp:RequiredFieldValidator> 
                <asp:RegularExpressionValidator
                    ID="revAddLEngth"
                    runat="server" ForeColor="Red" Display="Dynamic"
                    ErrorMessage="Minimum 5 and Maximum 20 characters required!"
                    ControlToValidate="TextBoxAddCategory" EnableClientScript="False" Text="*"
                    ValidationExpression="^[\s\S]{5,8}$"
                    ValidationGroup="ValidateAddCategoryGroup">
                </asp:RegularExpressionValidator> 
            </asp:Label>
            <asp:LinkButton ID="LinkButtonCreate" runat="server" Text="Create" CssClass="link-button" OnClick="LinkButtonCreate_OnClick"/>
            <asp:LinkButton ID="LinkButtonCancelCreate" runat="server" Text="Cancel" CssClass="link-button" OnClick="LinkButtonHideCreatePanel_OnClick"/>
        </asp:Panel>
        <asp:Panel ID="PanelEditCategory" runat="server" CssClass="panel" Visible="False">
            <h2>Edit Category</h2>
            <asp:Label runat="server"  AssociatedControlID="TextBoxEditCategory" Text="Category: ">
                <asp:TextBox ID="TextBoxEditCategory" runat="server" placeholder="Enter Category name..."></asp:TextBox>  
                <asp:RequiredFieldValidator
                    ID="rfvEditCategory"
                    runat="server" ForeColor="Red" Display="Dynamic"
                    ErrorMessage="Category field is required!"
                    ControlToValidate="TextBoxEditCategory" EnableClientScript="False" Text="*"
                    ValidationGroup="ValidateEditCategoryGroup">
                </asp:RequiredFieldValidator> 
                <asp:RegularExpressionValidator
                    ID="revEditLength"
                    runat="server" ForeColor="Red" Display="Dynamic"
                    ErrorMessage="Minimum 5 and Maximum 20 characters required!"
                    ControlToValidate="TextBoxEditCategory" EnableClientScript="False" Text="*"
                    ValidationExpression="^[\s\S]{5,8}$"
                    ValidationGroup="ValidateEditCategoryGroup">
                </asp:RegularExpressionValidator> 
            </asp:Label>
            <asp:LinkButton ID="LinkButtonEdit" runat="server" Text="Edit" CssClass="link-button" OnClick="LinkButtonEdit_OnClick"/>
            <asp:LinkButton ID="LinkButtonCancelEdit" runat="server" Text="Cancel" CssClass="link-button" OnClick="LinkButtonHideEditPanel_OnClick"/>
        </asp:Panel>

        <div class="back-link">
            <a href="/">Back to books</a>
        </div>
    </div>

</asp:Content>
