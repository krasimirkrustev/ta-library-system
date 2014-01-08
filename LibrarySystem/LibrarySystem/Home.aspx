<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LibrarySystem.Home" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="span4">
            <h1>Books</h1>
        </div>
        <div class="span8">
            <div class="form-search pull-right">
                <div class="search-button">
                    <div class="input-append">
                        <asp:TextBox ID="TextBoxQuery" runat="server" CssClass="span3 search-query" 
                            placeholder="Search by book title / author..."/>
                        <asp:LinkButton ID="LinkButtonSearch" runat="server" 
                            CssClass="btn" Text="Search" OnClick="LinkButtonSearch_OnClick"/>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <asp:ListView ID="ListViewCategories" runat="server"
        ItemType="LibrarySystem.Models.CategoryDTO"
        SelectMethod="RepeaterCategoriesAndBooks_GetData">
        <LayoutTemplate>
            <div class="row">
                <div id="itemPlaceholder" runat="server"></div>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="span4">
                <h2><%#: Item.Name %></h2>
                <ul>
                    <asp:Repeater runat="server" DataSource="<%# Item.Books %>" ItemType="LibrarySystem.Models.BookDTO">
                        <ItemTemplate>
                            <li>
                                <a href="BookDetails.aspx?id=<%#: Item.Id %>"><%#: Item.Title %> - <i><%#: Item.Authors %></i></a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </ItemTemplate>
        <EmptyItemTemplate>
            <p>No Books were found!</p>
        </EmptyItemTemplate>
    </asp:ListView>
</asp:Content>
