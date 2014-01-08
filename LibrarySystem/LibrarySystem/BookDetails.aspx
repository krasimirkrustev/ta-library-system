<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="LibrarySystem.BookDetails" %>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="FormViewBookDetails" runat="server" ItemType="LibrarySystem.Models.Book"
        SelectMethod="FormViewBookDetails_GetData">
        <ItemTemplate>
            <header>
                <h1>Book Details</h1>
                <p class="book-title"><%#: Item.Title %></p>
                <p class="book-author"><%#: Item.Author %></p>
                <p class="book-isbn"><%#: Item.ISBN %></p>
                <p class="book-isbn"><i>Web-site: <a href="<%#: Item.Website %>"><%#: Item.Website %></a></i></p>
            </header>
            <div class="row-fluid">
                <div class="span12 book-description">
                    <p><%#: Item.Description %></p>
                </div>
            </div>
            <div class="back-link">
                <a href="/">Back to books</a>
            </div>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
