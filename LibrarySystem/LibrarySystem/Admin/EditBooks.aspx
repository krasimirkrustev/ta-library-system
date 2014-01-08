<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditBooks.aspx.cs" Inherits="LibrarySystem.Admin.EditBooks" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <h1>Edit Books</h1>
        </div>
    </div>
    <div class="row">
        <div class="span4 offset4">
            <asp:ValidationSummary
                    ForeColor="Red"
                    DisplayMode="List"
                    EnableClientScript="true"
                    runat="server" ValidationGroup="ValidateEditBookGroup" /> 
            <asp:ValidationSummary
                    ForeColor="Red"
                    DisplayMode="List"
                    EnableClientScript="true"
                    runat="server" ValidationGroup="ValidateAddBookGroup" /> 
        </div>
    </div>
    <div class="row">
        <asp:GridView ID="GridViewBooks" runat="server" ItemType="LibrarySystem.Models.BookDTO"
            SelectMethod="GridViewBooks_GetData" AutoGenerateColumns="False" CssClass="gridview"
            AllowPaging="True" PageSize="5" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Authors" HeaderText="Author" SortExpression="Author" />
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                <asp:TemplateField SortExpression="Website">
                    <HeaderTemplate>Web Site</HeaderTemplate>
                    <ItemTemplate><a href="<%#: Item.Website %>"><%#: Item.Website %></a></ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" />
                <asp:TemplateField>
                    <HeaderTemplate>
                        Action
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButtonEdit" runat="server"
                            CommandArgument="<%#: Item.Id %>" OnCommand="LinkButtonEdit_OnCommand"
                            Text="Edit" CssClass="link-button" />
                        <asp:LinkButton ID="LinkButtonDelete" runat="server"
                            CommandArgument="<%#: Item.Id %>" OnCommand="LinkButtonDelete_OnCommand"
                            Text="Delete" CssClass="link-button" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div class="create-link">
            <asp:LinkButton ID="LinkButtonShowCreatePanel" runat="server" CssClass="link-button" OnClick="LinkButtonShowCreatePanel_OnClick">Create New</asp:LinkButton>
        </div>
        <asp:Panel ID="PanelCreateBook" runat="server" CssClass="panel" Visible="False">
            <h2>Create New Book</h2>
            <asp:Label runat="server" AssociatedControlID="TextBoxAddTitle">
                <span>Title: </span>
                <asp:TextBox ID="TextBoxAddTitle" runat="server" placeholder="Enter Book title ..."></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvAddTitle"
                    runat="server" ForeColor="Red" Display="Dynamic"
                    ErrorMessage="Title field is required!"
                    ControlToValidate="TextBoxAddTitle" EnableClientScript="False" Text="*"
                    ValidationGroup="ValidateAddBookGroup">
                </asp:RequiredFieldValidator> 
            </asp:Label>
            <asp:Label runat="server" AssociatedControlID="TextBoxAddAuthor">
                <span>Author: </span>
                <asp:TextBox ID="TextBoxAddAuthor" runat="server" placeholder="Enter book author / authors ..."></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvAddAuthor"
                    runat="server" ForeColor="Red" Display="Dynamic"
                    ErrorMessage="Author field is required!"
                    ControlToValidate="TextBoxAddAuthor" EnableClientScript="False" Text="*"
                    ValidationGroup="ValidateAddBookGroup">
                </asp:RequiredFieldValidator> 
            </asp:Label>
            <asp:Label runat="server" AssociatedControlID="TextBoxAddISBN">
                <span>ISBN: </span>
                <asp:TextBox ID="TextBoxAddISBN" runat="server" placeholder="Enter book ISBN ..."></asp:TextBox>
            </asp:Label>
            <asp:Label runat="server" AssociatedControlID="TextBoxAddWebsite">
                <span>Web site: </span>
                <asp:TextBox ID="TextBoxAddWebsite" runat="server" placeholder="Enter book website ..."></asp:TextBox>
            </asp:Label>
            <asp:Label runat="server" AssociatedControlID="TextBoxAddDescription">
                <span>Description: </span>
                <asp:TextBox ID="TextBoxAddDescription" runat="server" TextMode="MultiLine" placeholder="Enter book description ..."></asp:TextBox>
            </asp:Label>
            <asp:Label runat="server" AssociatedControlID="DropDownListAddCategory">
                <span>Category: </span>
                <asp:DropDownList ID="DropDownListAddCategory" runat="server"/>
            </asp:Label>
            <asp:LinkButton ID="LinkButtonCreate" runat="server" Text="Create" CssClass="link-button" OnClick="LinkButtonCreate_OnClick" />
            <asp:LinkButton ID="LinkButtonCancelCreate" runat="server" Text="Cancel" CssClass="link-button" OnClick="LinkButtonHideCreatePanel_OnClick" />
        </asp:Panel>
        <asp:Panel ID="PanelEditBook" runat="server" CssClass="panel" Visible="False">
            <h2>Edit Book</h2>
            <asp:Label runat="server" AssociatedControlID="TextBoxEditTitle">
                <span>Title: </span>
                <asp:TextBox ID="TextBoxEditTitle" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvEditTitle"
                    runat="server" ForeColor="Red" Display="Dynamic"
                    ErrorMessage="Title field is required!"
                    ControlToValidate="TextBoxEditTitle" EnableClientScript="False" Text="*"
                    ValidationGroup="ValidateEditBookGroup">
                </asp:RequiredFieldValidator> 
            </asp:Label>
            <asp:Label runat="server" AssociatedControlID="TextBoxAddAuthor">
                <span>Author: </span>
                <asp:TextBox ID="TextBoxEditAuthor" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvEditAuthor"
                    runat="server" ForeColor="Red" Display="Dynamic"
                    ErrorMessage="Author field is required!"
                    ControlToValidate="TextBoxEditAuthor" EnableClientScript="False" Text="*"
                    ValidationGroup="ValidateEditBookGroup">
                </asp:RequiredFieldValidator> 
            </asp:Label>
            <asp:Label runat="server" AssociatedControlID="TextBoxAddISBN">
                <span>ISBN: </span>
                <asp:TextBox ID="TextBoxEditISBN" runat="server"></asp:TextBox>
            </asp:Label>
            <asp:Label runat="server" AssociatedControlID="TextBoxAddWebsite">
                <span>Web site: </span>
                <asp:TextBox ID="TextBoxEditWebsite" runat="server"></asp:TextBox>
            </asp:Label>
            <asp:Label runat="server" AssociatedControlID="TextBoxAddDescription">
                <span>Description: </span>
                <asp:TextBox ID="TextBoxEditDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            </asp:Label>
            <asp:Label runat="server" AssociatedControlID="DropDownListEditCategory">
                <span>Category: </span>
                <asp:DropDownList ID="DropDownListEditCategory" runat="server"/>
            </asp:Label>
            <asp:LinkButton ID="LinkButtonEdit" runat="server" Text="Edit" CssClass="link-button" OnClick="LinkButtonEdit_OnClick" />
            <asp:LinkButton ID="LinkButtonEditCancel" runat="server" Text="Cancel" CssClass="link-button" OnClick="LinkButtonHideEditPanel_OnClick" />
        </asp:Panel>
        <div class="back-link">
            <a href="/">Back to books</a>
        </div>
    </div>
</asp:Content>
